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
