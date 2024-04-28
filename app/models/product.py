# app/models/product.py

from app import db  # Import the SQLAlchemy instance

class Product(db.Model):
    __tablename__ = 'products'
    id = db.Column(db.Integer, primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    price = db.Column(db.Numeric(10, 2), nullable=False)
    is_new = db.Column(db.Boolean, default=True, nullable=False)
    color = db.Column(db.String(50))
    stock = db.Column(db.Integer)
    cover_image = db.Column(db.String(255))
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())
    updated_at = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())

    @classmethod
    def get_all_products(cls):
        products = cls.query.all()
        return [{
            'id': product.id,
            'category_id': product.category_id,
            'name': product.name,
            'price': str(product.price),
            'is_new': product.is_new,
            'color': product.color,
            'stock': product.stock,
            'cover_image': product.cover_image,
            'created_at': product.created_at.isoformat(),
            'updated_at': product.updated_at.isoformat()
        } for product in products]

    @classmethod
    def get_new_products_by_category(cls, category_id):
        products = cls.query.filter_by(category_id=category_id, is_new=True).all()
        return [{
            'id': product.id,
            'category_id': product.category_id,
            'name': product.name,
            'price': str(product.price),
            'is_new': product.is_new,
            'cover_image': product.cover_image
        } for product in products]
        
    @classmethod
    def get_products_by_query(cls, query):
        # Construct the query to filter products based on the provided query
        products = Product.query.filter(Product.name.ilike(f"%{query}%")).all()
        
        # Return the list of products as dictionaries
        return [{
            'id': product.id,
            'category_id': product.category_id,
            'name': product.name,
            'price': str(product.price),
            'is_new': product.is_new,
            'cover_image': product.cover_image
        } for product in products]

        
    def __repr__(self):
        return f'<Product {self.name}>'
