cat <<EOF > README.md
# IWAJU Sales Intelligence — Infrastructure BI & Analytics

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Apache Superset](https://img.shields.io/badge/Apache%20Superset-0073B7?style=for-the-badge&logo=apache-superset&logoColor=white)](https://superset.apache.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

Déploiement d'une plateforme de Business Intelligence complète basée sur **Apache Superset**, **PostgreSQL** et **Docker**, réalisée dans le cadre du Challenge Technique **IWAJU TECH**.

## 🏗 Architecture du Système

L'infrastructure est déployée sur une machine virtuelle isolée :
- **Hôte :** Ubuntu Desktop
- **VM :** Ubuntu Server 22.04 LTS (KVM/QEMU)
- **Conteneurisation :** Docker & Docker Compose
  - \`superset_app\` : Application Apache Superset 3.1.0
  - \`superset_db\` : Base de données PostgreSQL 15

---

## 🛠 Stack Technique

| Composant | Technologie |
| :--- | :--- |
| **Virtualisation** | Ubuntu Server 22.04 LTS |
| **Conteneurisation** | Docker & Docker Compose |
| **Plateforme BI** | Apache Superset 3.1.0 |
| **Base de données** | PostgreSQL 15 |
| **Sécurité** | Variables d'environnement (\`.env\`) |

---

## 📂 Structure du Dépôt

\`\`\`text
iwaju-bi-project/
├── docker-compose.yml     # Orchestration des conteneurs
├── superset_config.py     # Configuration avancée de Superset
├── .env.example           # Modèle des variables d'environnement
├── .gitignore             # Exclusion des fichiers sensibles et système
└── README.md              # Documentation du projet
\`\`\`

---

## 🚀 Installation et Déploiement

### 1. Cloner le projet
\`\`\`bash
git clone https://github.com/Owedjangdev/iwaju-bi-project.git
cd iwaju-bi-project
cp .env.example .env
\`\`\`

### 2. Lancer l'infrastructure
Les volumes Docker (\`postgres_data\` et \`superset_home\`) assurent la **persistance des données**.
\`\`\`bash
docker-compose up -d
\`\`\`

### 3. Initialiser Superset
\`\`\`bash
docker exec -it superset_app pip install psycopg2-binary
docker exec -it superset_app superset db upgrade
docker exec -it superset_app superset fab create-admin --username admin --firstname Epiphane --lastname Houehanou --email admin@iwaju.com --password admin
docker exec -it superset_app superset init
\`\`\`

---

## 📊 Dashboard : IWAJU Sales Intelligence

Le dashboard transforme le dataset "Superstore Sales" en indicateurs de performance clés :

* **KPIs :** Ventes Globales et Profit Total.
* **Analyses Visuelles :**
    * Évolution temporelle des ventes.
    * Répartition des ventes par **Catégorie de produits**.
    * Analyse géographique par **Région** (Région "West" identifiée comme leader).

---

## 👨‍💻 Auteur
**HOUEHANOU Epiphane Owédjangnon**
*Challenge Technique — IWAJU TECH*
Échéance : 19 Avril 2026
EOF
