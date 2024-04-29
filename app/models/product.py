
from app import db  # Import the SQLAlchemy instance

class Product(db.Model):
    # Table schema remains the same
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
    def get_products_by_query(cls, query):
        return Product.query.filter(Product.name.ilike(f"%{query}%"))
    
    @classmethod
    def get_products_by_id(cls, id):
        return cls.query.filter_by(id=id).first()
    
    @classmethod
    def get_new_products_by_category(cls, category_id):
        return cls.query.filter_by(category_id=category_id, is_new=True).all()

    # Other methods remain unchanged
        
    def __repr__(self):
        return f'<Product {self.name}>'