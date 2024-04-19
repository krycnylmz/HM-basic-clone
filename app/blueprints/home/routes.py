from flask import Blueprint, render_template
from app.models.product import Product 

# Initialize the Blueprint with a name and a URL prefix
home_bp = Blueprint('home', __name__)

# Define a route
@home_bp.route('/')
def home():
    products = Product.get_all_products()
    return render_template('home.html', products=products)
