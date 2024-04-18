from flask import Blueprint, render_template

products_bp = Blueprint('products', __name__, url_prefix='/products')

@products_bp.route('/')
def products():
    return render_template('products.html')
