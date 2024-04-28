from flask import Blueprint, render_template, request
from app.models.product import Product
from app.models.category import Category
import re

# Initialize the Blueprint with a name and a URL prefix
searchResults_bp = Blueprint('searchResults', __name__)



@searchResults_bp.route('/search-results.html', methods=['GET'])
def searchResults():
    # Get the query input from the request
    query_input = request.args.get('q')

    # Check if the query input is safe
    if query_input and is_safe_input(query_input):
        # Construct the query using safe input
        products = Product.get_products_by_query(query_input)
    else:
        # Handle the case when the query input is not safe or empty
        products = []

    # Get all categories
    categories = Category.get_all_categories()
    
    # Calculate the total number of products for each category
    for category in categories:
        category.products_count = Product.query.filter_by(category_id=category.id).count()
    
    total_products = Product.query.count()
    return render_template('search-results.html', products=products, categories=categories, query_input=query_input,total_products=total_products)


# Define a regular expression pattern to match safe characters
SAFE_PATTERN = re.compile(r'^[a-zA-Z0-9\sığüşöçĞÜŞÖÇİ]+$')
def is_safe_input(input_str):
    """
    Function to check if the input string contains only safe characters.
    """
    return bool(SAFE_PATTERN.match(input_str))