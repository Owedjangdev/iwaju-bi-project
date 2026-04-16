import os

# 1. Clé de sécurité récupérée dynamiquement
SECRET_KEY = os.getenv('SUPERSET_SECRET_KEY')

# 2. Connexion DB sécurisée
DB_PASS = os.getenv('POSTGRES_PASSWORD')
SQLALCHEMY_DATABASE_URI = f'postgresql://superset:{DB_PASS}@db:5432/superset'

# 3. Langue
BABEL_DEFAULT_LOCALE = 'fr'
