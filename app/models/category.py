from app import db  # Import the SQLAlchemy instance from your application factory

class Category(db.Model):
    __tablename__ = 'categories'  # Defines the table name explicitly

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(100), nullable=False)
    created_at = db.Column(db.DateTime, default=db.func.current_timestamp())
    
    @classmethod
    def get_all_categories(cls):
        categories = cls.query.all()
        return [{
            'id': category.id,
            'name': category.name,
            'slug':category.slug
        } for category in categories]

    def __repr__(self):
        return f'<Category {self.name}>'
