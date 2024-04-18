from flask import Blueprint, jsonify

api_v1_bp = Blueprint('api_v1', __name__, url_prefix='/api/v1')

@api_v1_bp.route('/products')
def get_products():
    # Örnek veri
    products = [{"id": 1, "name": "T-shirt"}, {"id": 2, "name": "Jeans"}]
    return jsonify(products)
