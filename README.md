# Multi-screen Flutter Project

Il s'agit d'une application Flutter multi-écrans permettant de découvrir et de soumettre des projets open-source.

## 🚀 Fonctionnalités
- **Accueil** : Présentation et accès rapide.
- **Liste & Filtres** : Recherche dynamique par texte et filtre par catégorie (Web, Mobile).
- **Détails** : Affichage complet du projet sélectionné via paramètre d'URL.
- **Formulaire de soumission** : Validation complète sur 4 champs (Titre, Description, Catégorie, Tags).
- **Mode Sombre / Clair** : Basculement dynamique du thème.
- **Design Responsive** : Bascule automatique entre liste (Mobile) et grille (Tablette).

## 🛠️ Stack Technique
- **Flutter** & **Dart**
- **GoRouter** (Navigation déclarative)
- **Material 3**

## 📐 Architecture & Séparation des Responsabilités

L'application suit une **architecture en couches découplée (Layer-First)** pour garantir maintenabilité et testabilité :

```text
lib/
├── constants/     # Constantes d'application (chaînes, dimensions)
├── models/        # Modèles de données (Project)
├── repository/    # Gestionnaire de données & logique de filtrage (ProjectRepository)
├── router/        # Routing déclaratif avec GoRouter
├── screens/       # Vues principales de l'application
├── theme/         # Configuration des thèmes Light / Dark (Material 3)
└── widgets/       # Composants UI réutilisables (Cards, Buttons, Chips, States)