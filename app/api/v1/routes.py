from flask import Blueprint, jsonify
from app import db
from app.models.category import Category
from app.models.product import Product

api_v1_bp = Blueprint('api_v1', __name__, url_prefix='/api/v1')

@api_v1_bp.route('/products', methods=['GET'])
def get_products():
    product_list = Product.get_all_products()
    return jsonify(product_list)


@api_v1_bp.route('/categories')
def get_categories():
    try:
        categories = Category.query.all()
        category_list = [{"id": category.id, "name": category.name} for category in categories]
        return jsonify(category_list)
    except Exception as e:
        return jsonify({"error": str(e)}), 500
