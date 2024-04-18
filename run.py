from app import create_app

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)


# from flask import Flask, jsonify, request, render_template
# from flask_mysqldb import MySQL
# from dotenv import load_dotenv
# import os

# app = Flask(__name__)

# # MySQL bağlantı ayarları
# app.config['MYSQL_HOST'] = os.getenv("MYSQL_HOST")
# app.config['MYSQL_USER'] = os.getenv("MYSQL_USER")
# app.config['MYSQL_PASSWORD'] = os.getenv("MYSQL_PASSWORD")
# app.config['MYSQL_DB'] = os.getenv("MYSQL_DB")
# app.config['MYSQL_CURSORCLASS'] = os.getenv("MYSQL_CURSORCLASS")

# # MySQL nesnesini oluştur
# mysql = MySQL(app)

# # /api endpoint'i
# @app.route('/api/categories', methods=['GET'])
# def get_data():
#     try:
#         # Veritabanı bağlantısı
#         cur = mysql.connection.cursor()

#         # Veritabanından veri seçme
#         cur.execute('SELECT * FROM `categories`')  # Fix: Wrap table name in backticks
#         data = cur.fetchall()

#         # Bağlantıyı kapat
#         cur.close()

#         # JSON formatında veri döndürme
#         return jsonify(data)

#     except Exception as e:
#         return jsonify({'error': str(e)}), 500


# # Sample data
# products = [
#     {"id": 1, "title": "T-shirt", "author": "Author 1"},
#     {"id": 2, "title": "Book 2", "author": "Author 2"},
#     {"id": 3, "title": "Book 3", "author": "Author 3"}
# ]

# # GET request to fetch all books
# @app.route('/', methods=['GET'])
# def get_home():
#     return "koray"

# # GET request to fetch all books
# @app.route('/products', methods=['GET'])
# def get_books():
#     return jsonify(products)

# # GET request to fetch a specific book by id
# @app.route('/products/<int:product_id>', methods=['GET'])
# def get_products(product_id):
#     product = next((product for product in products if product['id'] == product_id), None)
#     if product:
#         return jsonify(product)
#     else:
#         return jsonify({"error": "Book not found"}), 404

# # POST request to add a new book
# @app.route('/products', methods=['POST'])
# def add_book():
#     data = request.json
#     new_product = {
#         "id": len(products) + 1,
#         "title": data['title'],
#         "author": data['author']
#     }
#     product.append(new_product)
#     return jsonify(new_product), 201

# # PUT request to update a book
# @app.route('/products/<int:product_id>', methods=['PUT'])
# def update_book(product_id):
#     data = request.json
#     product = next((product for product in products if product['id'] == product_id), None)
#     if product:
#         product.update(data)
#         return jsonify(product)
#     else:
#         return jsonify({"error": "product not found"}), 404

# # DELETE request to delete a book
# @app.route('/products/<int:product_id>', methods=['DELETE'])
# def delete_book(product_id):
#     global products
#     products = [product for product in products if product['id'] != product_id]
#     return jsonify({"message": "product deleted successfully"}), 200

# if __name__ == '__main__':
#     app.run(debug=True)



