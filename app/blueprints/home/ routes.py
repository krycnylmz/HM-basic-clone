from flask import Blueprint, render_template

# Initialize the Blueprint with a name and a URL prefix
home_bp = Blueprint('home', __name__, url_prefix='/home')

# Define a route
@home_bp.route('/')
def home():
    return render_template('home.html')
