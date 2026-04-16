import os

SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY')
SQLALCHEMY_DATABASE_URI = (
    f"postgresql://{os.environ.get('POSTGRES_USER')}:"
    f"{os.environ.get('POSTGRES_PASSWORD')}@db:5432/"
    f"{os.environ.get('POSTGRES_DB')}"
)
BABEL_DEFAULT_LOCALE = 'fr'
