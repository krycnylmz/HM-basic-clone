from flask import Flask

def create_app():
    app = Flask(__name__)
    
    from .blueprints.home.routes import home_bp
    app.register_blueprint(home_bp)
    
    from .blueprints.products.routes import products_bp
    app.register_blueprint(products_bp)
    
    from .api.v1.routes import api_v1_bp
    app.register_blueprint(api_v1_bp)
    
    return app

