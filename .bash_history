ping -c 8.8.8.8
ping -c 3  8.8.8.8
sudo nano /etc/netplan/00-installer.config.yaml
# 1. Mise à jour et installation de Docker
sudo apt update && sudo apt install -y docker.io docker-compose
# 2. Ajout de ton utilisateur au groupe docker pour travailler sans 'sudo'
sudo usermod -aG docker $USER
# 3. Application immédiate des droits (très important)
newgrp docker
docker run hello-world
mkdir ~/iwaju-bi-project
cd ~/iwaju-bi-project
nano docker-compose.yml
docker-compose up -d
cd .
cd ..
cd iwaju-bi-project/
docker-compose up -d
docker exec -it superset_app superset fab create-admin --username admin --firstname Epiphane --lastname Houehanou --email admin@iwaju.com --password admin
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset init
docker exec -it superset_app bash -c "echo 'PREVENT_UNSAFE_DB_CONNECTIONS = False' >> /app/superset_home/superset_config.py && echo 'CSV_TO_HIVE_UPLOAD_DIRECTORY = \"/tmp/\"' >> /app/superset_home/superset_config.py"
docker restart superset_app
docker exec -it superset_app bash -c "superset set_database_uri -d IWAJU_Database -u 'sqlite:////app/superset_home/superset.db'"
docker exec -it superset_app bash -c "echo 'PREVENT_UNSAFE_DB_CONNECTIONS = False' > /app/pythonpath/superset_config.py"
docker restart superset_app
iconv -f latin1 -t utf-8 ~/Downloads/superstoreSales.csv > ~/Downloads/superstoreSales_utf8.csv
docker restart superset_app
cd ~/iwaju-bi-project
docker stop superset_app
docker rm superset_app
cat > docker-compose.yml << 'EOF'
version: "3.8"
services:
  db:
    image: postgres:15
    container_name: superset_db
    environment:
      POSTGRES_DB: superset
      POSTGRES_USER: superset
      POSTGRES_PASSWORD: superset123
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

  superset:
    image: apache/superset:latest
    container_name: superset_app
    ports:
      - "8088:8088"
    environment:
      - SUPERSET_SECRET_KEY=iwaju_secret_2026
      - DATABASE_URL=postgresql+psycopg2://superset:superset123@db:5432/superset
    volumes:
      - superset_home:/app/superset_home
    depends_on:
      - db
    restart: always

volumes:
  postgres_data:
  superset_home:
EOF

cat > docker-compose.yml << 'EOF'
version: "3.8"
services:
  db:
    image: postgres:15
    container_name: superset_db
    environment:
      POSTGRES_DB: superset
      POSTGRES_USER: superset
      POSTGRES_PASSWORD: superset123
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

  superset:
    image: apache/superset:latest
    container_name: superset_app
    ports:
      - "8088:8088"
    environment:
      - SUPERSET_SECRET_KEY=iwaju_secret_2026
      - DATABASE_URL=postgresql+psycopg2://superset:superset123@db:5432/superset
    volumes:
      - superset_home:/app/superset_home
    depends_on:
      - db
    restart: always

volumes:
  postgres_data:
  superset_home:
EOF

nano docker-compose.yml
docker-compose up -d
epiphane@iwajutech:~/iwaju-bi-project$ docker-compose up -d
Pulling db (postgres:15)...
15: Pulling from library/postgres
a8a0725a32a6: Download complete
5435b2dcdf5c: Downloading (65.9%)
71a32c7571f4: Download complete
af2a6e5f285c: Download complete
af0c3ea2fe5e: Download complete
b4765ac2e7e6: Downloading (26.9%)
00f33d580dc3: Download complete
5c152148754e: Download complete
f7049a93e93f: Download complete
2c38b75ffca2: Download complete
9328c154beae: Download complete
c45b346571fc: Download complete
8ecdbd190da6: Download complete
5ca81a59b0a4: Download complete
cebcba07837b: Download complete
b9015a4f6b87: Download complete
ERROR: failed to copy: read tcp 192.168.122.45:33828->172.64.66.1:443: read: network is unreachable
epiphane@iwajutech:~/iwaju-bi-project$ docker-compose up -d
Pulling db (postgres:15)...
15: Pulling from library/postgres
a8a0725a32a6: Pull complete
5435b2dcdf5c: Pull complete
2c38b75ffca2: Pull complete
b4765ac2e7e6: Pull complete
c45b346571fc: Pull complete
9328c154beae: Pull complete
8ecdbd190da6: Pull complete
71a32c7571f4: Pull complete
af2a6e5f285c: Pull complete
af0c3ea2fe5e: Pull complete
00f33d580dc3: Pull complete
5c152148754e: Pull complete
f7049a93e93f: Pull complete
5ca81a59b0a4: Pull complete
cebcba07837b: Download complete
b9015a4f6b87: Download complete
Digest: sha256:3e43515057e113ee741fca2f621f15300be34a6d4a8dfcf2e20651288c8272f3
Status: Downloaded newer image for postgres:15
Creating superset_db ... done
Creating superset_app ... done
epiphane@iwajutech:~/iwaju-bi-project$ 
# 1. Créer l'utilisateur admin
docker exec -it superset_app superset fab create-admin --username admin --firstname admin --lastname admin --email admin@iwaju.com --password admin
# 2. Mettre à jour la base de données interne
docker exec -it superset_app superset db upgrade
# 3. Initialiser Superset
docker exec -it superset_app superset init
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset init
docker exec -it superset_app superset fab create-admin --username admin --firstname admin --lastname admin --email admin@iwaju.com --password admin
docker exec -it superset_app env | grep SQL
# Va dans le dossier où Superset stocke ses données
cd ~/iwaju-bi-project/superset_home
# Renomme le fichier SQLite pour que Superset ne puisse plus l'ouvrir
mv superset.db superset.db.bloque
ls -R ~/iwaju-bi-project
rm "~/iwaju-bi-project/172.64.66.1:443:"
mkdir -p ~/iwaju-bi-project/superset_home
nano ~/iwaju-bi-project/docker-compose.yml
docker compose down -v
docker-compose down -v
docker-compose up -d
docker ps
docker exec -it superset_app superset db upgrade
docker-compose down -v
SQLALCHEMY_DATABASE_URI="postgresql://superset:superset123@db:5432/superset" docker-compose up -d
docker exec -it superset_app superset db upgrade
docker rmi apache/superset:latest
docker-compose up -d
docker-compose down
docker rm -f superset_app superset_db
nano docker-compose.yml
# On arrête tout et on supprime les anciens volumes qui cachent SQLite
docker-compose down -v
# On relance tout proprement
docker-compose up -d
# On arrête tout et on supprime les anciens volumes qui cachent SQLite
docker-compose down -v
# On relance tout proprement
docker-compose up -d
docker exec -it superset_app superset db upgrade
docker-compose down -v
docker-compose up -d
docker exec -it superset_app superset db upgrade
ls -la
docker-compose down -v
SQLALCHEMY_DATABASE_URI="postgresql+psycopg2://superset:superset123@db:5432/superset" docker-compose up -d
docker exec -it superset_app superset db upgrade
docker exec -it superset_app bash -c "echo 'SQLALCHEMY_DATABASE_URI = \"postgresql+psycopg2://superset:superset123@db:5432/superset\"' > /app/pythonpath/superset_config.py"
docker restart superset_app
docker exec -it superset_app bash -c "echo 'SQLALCHEMY_DATABASE_URI = \"postgresql+psycopg2://superset:superset123@db:5432/superset\"' > /app/pythonpath/superset_config.py"
docker restart superset_app
docker exec -it superset_app superset db upgrade
cat > ~/iwaju-bi-project/superset_config.py << 'EOF'
SQLALCHEMY_DATABASE_URI = "postgresql+psycopg2://superset:superset123@db:5432/superset"
SECRET_KEY = "iwaju_secret_2026"
EOF

cat > ~/iwaju-bi-project/docker-compose.yml << 'EOF'
version: "3.8"
services:
  db:
    image: postgres:15
    container_name: superset_db
    environment:
      POSTGRES_DB: superset
      POSTGRES_USER: superset
      POSTGRES_PASSWORD: superset123
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

  superset:
    image: apache/superset:latest
    container_name: superset_app
    ports:
      - "8088:8088"
    environment:
      SUPERSET_CONFIG_PATH: /app/pythonpath/superset_config.py
    volumes:
      - superset_home:/app/superset_home
      - ./superset_config.py:/app/pythonpath/superset_config.py
    depends_on:
      - db
    restart: always

volumes:
  postgres_data:
  superset_home:
EOF

docker-compose down -v
docker-compose up -d
docker exec -it superset_app superset db upgrade
docker-compose down
sed -i 's|image: apache/superset:latest|image: apache/superset:3.1.0|' ~/iwaju-bi-project/docker-compose.yml
grep "image:" ~/iwaju-bi-project/docker-compose.yml
docker-compose up -d
sudo dhclient enp1s0
ping -c 4 8.8.8.8
ip q
ip a
sudo apt update
sudo apt install openssh-server
sudo systemctl  enable --now ssh
cd ~/iwaju-bi-project
docker-compose up -d
docker exec -it superset_app pip install psycopg2-binary
docker exec -it superset_app bash -c "echo 'SQLALCHEMY_DATABASE_URI = \"postgresql+psycopg2://superset:superset123@db:5432/superset\"' > /app/pythonpath/superset_config.py"
docker restart superset_app
docker exec -it superset_app superset db upgrade
openssl rand -base64 42
nano superset_config.py
cat docker-compose.yml
nano superset_config.py
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset fab create-admin
docker exec -it superset_app superset init
ssh -L 8088:localhost:8088 epiphane@192.168.122.74
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
ssh -L 8088:localhost:8088 epiphane@192.168.122.74
cd ~/iwaju-bi-project
cat docker-compose.yml
git init
git config user.name "Owedjangdev"
git config user.email "epiphanedev@gmail.com"
git branch -M main
git remote add origin https://github.com/Owedjangdev/iwaju-bi-project.git
git pull origin main --allow-unrelated-histories
cat ~/iwaju-bi-project/docker-compose.yml
cat ~/iwaju-bi-project/superset_config.py
cat > README.md << 'ENDOFFILE'
# IWAJU Sales Intelligence — Infrastructure BI & Analytics

Déploiement d'une plateforme de Business Intelligence complète basée sur Apache Superset, PostgreSQL et Docker, dans le cadre du Challenge Technique IWAJU TECH.

---

## Architecture du projet

Machine Hôte (Ubuntu Desktop)
└── VM Ubuntu Server 22.04 (KVM/QEMU)
    └── Docker
        ├── superset_db   (PostgreSQL 15)
        └── superset_app  (Apache Superset 3.1.0)

---

## Stack technique

| Composant | Technologie |
|-----------|-------------|
| Virtualisation | Ubuntu Server 22.04 LTS (KVM/QEMU) |
| Conteneurisation | Docker & Docker Compose |
| Plateforme BI | Apache Superset 3.1.0 |
| Base de données | PostgreSQL 15 |

---

## Structure du dépôt

iwaju-bi-project/
├── docker-compose.yml      # Orchestration des services
├── superset_config.py      # Configuration Superset (PostgreSQL, Secret Key)
└── README.md               # Documentation

---

## Prérequis

- Ubuntu Server 22.04 LTS
- Docker >= 20.x
- Docker Compose >= 1.29
- Git

---

## Installation et Déploiement

### 1. Cloner le dépôt

git clone https://github.com/Owedjangdev/iwaju-bi-project.git
cd iwaju-bi-project

### 2. Lancer les services

docker-compose up -d

Les services suivants démarrent automatiquement :
- superset_db  : PostgreSQL 15 sur le port 5432
- superset_app : Apache Superset sur le port 8088

### 3. Initialiser Superset

docker exec -it superset_app pip install psycopg2-binary

docker exec -it superset_app superset db upgrade

docker exec -it superset_app superset fab create-admin \
  --username admin \
  --firstname Epiphane \
  --lastname Houehanou \
  --email admin@iwaju.com \
  --password <votre_mot_de_passe>

docker exec -it superset_app superset init

### 4. Accéder a l interface

Ouvrir dans le navigateur depuis la machine hote :

http://<IP_VM>:8088

Identifiants : admin / votre_mot_de_passe

---

## Persistance des données

Les volumes Docker garantissent que les données survivent aux redémarrages :

postgres_data  : Données PostgreSQL
superset_home  : Configuration et métadonnées Superset

---

## Dashboard — IWAJU Sales Intelligence

Le dashboard est construit à partir du dataset Superstore Sales (8 400 lignes) et intègre 5 visualisations :

| Graphique | Type | Indicateur |
|-----------|------|------------|
| Total Sales | Big Number (KPI) | Ventes globales : 14.9M |
| Total Profit | Big Number (KPI) | Profit total : 1.52M |
| Sales Over Time | Line Chart | Evolution temporelle des ventes |
| Sales by Category | Pie Chart | Répartition par catégories de produits |
| Sales by Region | Bar Chart | Répartition par zones géographiques |

---

## Auteur

HOUEHANOU Epiphane Owédjangnon
Challenge Technique — IWAJU TECH
Avril 2026
ENDOFFILE

cat > README.md << 'ENDOFFILE'
rm README.md
nano README.md
cat README.md
git commit -m "Add professional documentation for IWAJU project"
git add docker-compose.yml superset_config.py
git commit -m "Ajout de la configuration Docker et de la config Superset"
git push origin main
ssh-keygen -t ed25519 -C "admin@iwaju.com"
cat ~/.ssh/id_ed25519.pub
git remote set-url origin git@github.com:Owedjangdev/iwaju-bi-project.git
git push origin main
nano README.md
git add README.md
git commit -m "Mise à jour  du README pour le projet IWAJU"
git push origin main
nano docker-compose.yml
nano superset_config.py
ip a
sudo dhclient enp1s0
ip a
cd ~
git config --global user.email "epiphanedev@gmail.com"
git config --global user.name "Owedjangdev"
git init
git remote add origin https://github.com/Owedjangdev/iwaju-bi-project.git
git config --global user.email "houehanouepiphane@gmail.com"
git config --global user.name "Owedjangdev"
git remote add origin https://github.com/Owedjangdev/iwaju-bi-project.git
git add docker-compose.yml README.md .gitignore .env.example superset_config.py
git commit -m "mise à jour: structure propre avec variables d'environnement"
git branch -M main
git push -u origin main
cat > ~/README.md << 'ENDOFFILE'
# IWAJU Sales Intelligence — Infrastructure BI & Analytics

Déploiement d'une plateforme de Business Intelligence complète basée sur Apache Superset, PostgreSQL et Docker, dans le cadre du Challenge Technique IWAJU TECH.

## Architecture du projet
Machine Hôte (Ubuntu Desktop)
└── VM Ubuntu Server 22.04 (KVM/QEMU)
    └── Docker
        ├── superset_db   (PostgreSQL 15)
        └── superset_app  (Apache Superset 3.1.0)

## Stack technique
| Composant | Technologie |
|-----------|-------------|
| Virtualisation | Ubuntu Server 22.04 LTS (KVM/QEMU) |
| Conteneurisation | Docker & Docker Compose |
| Plateforme BI | Apache Superset 3.1.0 |
| Base de données | PostgreSQL 15 |

## Prérequis
- Ubuntu Server 22.04 LTS
- Docker >= 20.x
- Docker Compose >= 1.29
- Git

## Installation et Déploiement

### 1. Cloner le dépôt
git clone https://github.com/Owedjangdev/iwaju-bi-project.git
cd iwaju-bi-project

### 2. Lancer les services
docker-compose up -d

### 3. Initialiser Superset
docker exec -it superset_app pip install psycopg2-binary
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset fab create-admin \
  --username admin \
  --firstname Epiphane \
  --lastname Houehanou \
  --email admin@iwaju.com \
  --password votre_mot_de_passe
docker exec -it superset_app superset init

### 4. Accéder à l'interface
http://<IP_VM>:8088
Identifiants : admin / votre_mot_de_passe

## Persistance des données
- postgres_data  : Données PostgreSQL
- superset_home  : Configuration et métadonnées Superset

## Dashboard — IWAJU Sales Intelligence
| Graphique | Type | Indicateur |
|-----------|------|------------|
| Total Sales | Big Number (KPI) | Ventes globales : 14.9M |
| Total Profit | Big Number (KPI) | Profit total : 1.52M |
| Sales Over Time | Line Chart | Evolution temporelle des ventes |
| Sales by Category | Pie Chart | Répartition par catégories de produits |
| Sales by Region | Bar Chart | Répartition par zones géographiques |

## Auteur
HOUEHANOU Epiphane Owédjangnon
Challenge Technique — IWAJU TECH
Avril 2026
ENDOFFILE

git add docker-compose.yml README.md .gitignore .env.example superset_config.py
git commit -m "mise à jour: structure propre avec variables d'environnement"
git branch -M main
git push -u origin main
ssh-keygen -t ed25519 -C "ton_email_github@gmail.com"
ssh-keygen -t ed25519 -C "houehanouepiphane@gmail.com"
git commit -m "mise à jour: structure propre avec variables d'environnement"
git push -u origin main
git remote set-url origin git@github.com:Owedjangdev/iwaju-bi-project.git
git push -u origin main
git pull origin main --allow-unrelated-histories
git push -u origin main
git config pull.rebase false
git pull origin main --allow-unrelated-histories
git push -u origin main
cat > ~/docker-compose.yml << 'EOF'
version: "3.8"
services:
  db:
    image: postgres:15
    container_name: superset_db
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always
  superset:
    image: apache/superset:3.1.0
    container_name: superset_app
    ports:
      - "8088:8088"
    environment:
      SUPERSET_CONFIG_PATH: /app/pythonpath/superset_config.py
      SUPERSET_SECRET_KEY: ${SUPERSET_SECRET_KEY}
    volumes:
      - superset_home:/app/superset_home
      - ./superset_config.py:/app/pythonpath/superset_config.py
    depends_on:
      - db
    restart: always
volumes:
  postgres_data:
  superset_home:
EOF

git add docker-compose.yml
git commit -m "correction: toutes les variables chargées depuis .env"
git push origin main
git checkout --theirs README.md
git checkout --theirs superset_config.py
git add README.md superset_config.py docker-compose.yml
git commit -m "correction: toutes les variables chargées depuis .env"
git push origin main
cat > ~/superset_config.py << 'EOF'
import os

SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY')
SQLALCHEMY_DATABASE_URI = (
    f"postgresql://{os.environ.get('POSTGRES_USER')}:"
    f"{os.environ.get('POSTGRES_PASSWORD')}@db:5432/"
    f"{os.environ.get('POSTGRES_DB')}"
)
BABEL_DEFAULT_LOCALE = 'fr'
EOF

git add superset_config.py
git commit -m "correction: suppression des valeurs par défaut sensibles"
git push origin main
