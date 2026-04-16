# 1. La clé de sécurité (obligatoire pour corriger ton erreur précédente)
SECRET_KEY = 'OfRtSACerJohbnbcjfFOGpRqXd0T7Rb68EoHokKVFbQGpjjpTjFRDnt7'

# 2. La connexion à la base de données
SQLALCHEMY_DATABASE_URI = 'postgresql://superset:superset123@db:5432/superset'

# 3. La langue en français (optionnel mais recommandé pour ton test)
BABEL_DEFAULT_LOCALE = 'fr'
