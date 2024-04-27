from flask import Blueprint, render_template, request
from app.models.product import Product
from app.models.category import Category

# Initialize the Blueprint with a name and a URL prefix
home_bp = Blueprint('home', __name__)

# # Define a route
# @home_bp.route('/')
# def home():
#     products = Product.get_all_products()
#     return render_template('home.html', products=products)


@home_bp.route('/')
def home():
    # Get the category name from the request
    category_slug = request.args.get('category') or 'kadin' 

    # Find the category ID corresponding to the category name
    category_id = None
    if category_slug:
        category = Category.query.filter_by(slug=category_slug).first()
        if category:
            category_id = category.id
            print("Category found:", category)
        else:
            print("Category Not found:")

    products = Product.get_new_products_by_category(category_id)
    categories = Category.get_all_categories()
    
    return render_template('home.html', products=products,categories=categories,selected_category=category_slug)
