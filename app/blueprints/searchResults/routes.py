from flask import Blueprint, render_template, request
from app.models.product import Product
from app.models.category import Category
import re
from sqlalchemy import desc, asc, func

searchResults_bp = Blueprint('searchResults', __name__)

# Define a regular expression pattern to match safe characters
SAFE_PATTERN = re.compile(r'^[a-zA-Z0-9\sığüşöçĞÜŞÖÇİ]+$')

def is_safe_input(input_str):
    """
    Function to check if the input string contains only safe characters.
    """
    return bool(SAFE_PATTERN.match(input_str))

@searchResults_bp.route('/search-results.html', methods=['GET'])
def searchResults():
    query_input = request.args.get('q', '').strip()  # Ensure trimming of whitespace
    query_sort = request.args.get('sort', None)

    if not query_input or not is_safe_input(query_input):
        # Early return if input is not safe or empty, showing no products
        return render_template('search-results.html', products=[], categories=Category.get_all_categories(),
                               query_input=query_input, total_products=0, selected_sort=query_sort)

    # Query building based on safe input
    query = Product.get_products_by_query(query_input)
    
    # Apply sorting based on query_sort parameter
    if query_sort == 'stock':
        query = query.order_by(func.random())
    elif query_sort == 'newProduct':
        query = query.filter(Product.is_new == True)
    elif query_sort == 'ascPrice':
        query = query.order_by(asc(Product.price))
    elif query_sort == 'descPrice':
        query = query.order_by(desc(Product.price))

    # Fetch the products after all conditions and sorting are applied
    products = query.all()

    # Retrieve all categories and count the products for each
    categories = Category.get_all_categories()
    for category in categories:
        category.products_count = Product.query.filter_by(category_id=category.id).count()
    
    total_products = Product.query.count()
    
    return render_template('search-results.html', products=products, categories=categories, query_input=query_input, total_products=total_products, selected_sort=query_sort)
