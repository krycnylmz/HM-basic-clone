from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
import os

db = SQLAlchemy()  # SQLAlchemy nesnesini global olarak oluştur

def create_app():
    app = Flask(__name__)
    
    # Çevre değişkenlerinden veritabanı yapılandırması
    user = os.getenv('MYSQL_USER', 'root')
    password = os.getenv('MYSQL_PASSWORD', '')
    host = os.getenv('MYSQL_HOST', 'localhost')
    database = os.getenv('MYSQL_DB', 'midterm_db')
    cursorclass = os.getenv('MYSQL_CURSORCLASS', 'DictCursor')

    app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{user}:{password}@{host}/{database}'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    

    
    db.init_app(app)
    
    # Initialize Flask-Migrate with the Flask app and the SQLAlchemy database object
    migrate = Migrate(app, db)
    
    
    from .blueprints.home.routes import home_bp
    app.register_blueprint(home_bp)
    
    from .blueprints.searchResults.routes import searchResults_bp
    app.register_blueprint(searchResults_bp)

    from .blueprints.productPage.routes import productPage_bp
    app.register_blueprint(productPage_bp)
    
    
    from .api.v1.routes import api_v1_bp
    app.register_blueprint(api_v1_bp)
    
    return app

