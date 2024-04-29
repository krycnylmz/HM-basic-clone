from flask import Blueprint, render_template, request
from app.models.product import Product
from app.models.category import Category

# Initialize the Blueprint with a name and a URL prefix
productPage_bp = Blueprint('productPage', __name__)

@productPage_bp.route('/productpage.<int:product_id>.html', methods=['GET'])
def product_page(product_id):
    # Construct the route dynamically based on the product_id query parameter
    route = f"/product-page.{product_id}.html"
    
    product = Product.get_products_by_id(product_id)
    # Get the query input from the request
    query_input = request.args.get('q')

    return render_template('product-page.html',product=product)
