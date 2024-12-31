# Mushroom GO 🍄

Mushroom GO est une application mobile innovante dédiée à l’identification et à la collecte de champignons grâce à des outils interactifs et intuitifs. L’objectif principal est d’aider les amateurs de champignons, les mycologues amateurs, ou les simples curieux à explorer, identifier, et partager leurs découvertes.

---

## 📂 Structure du projet

### Principaux dossiers :
- **`/lib`** : Contient tout le code source Flutter structuré par fonctionnalités.
    - **`/models`** : Classes représentant les données principales (par exemple, les missions, les badges).
    - **`/screen`** : Contient les différentes pages de l’application (par exemple, carte interactive, détails des badges).
    - **`/theme`** : Gère les thèmes et les styles de l’application.
    - **`/widgets`** : Regroupe les composants réutilisables (boutons, listes, etc.).
- **`/assets`** : Contient les ressources utilisées dans l'application.
    - **`/images`** : Les icônes et illustrations, comme les badges.
    - **`/fonts`** : Les polices personnalisées utilisées dans l'application.

---

## 🎯 Présentation de l'application

### Mushroom GO répond à un besoin :
Identifier facilement les champignons trouvés lors de balades ou de randonnées, tout en proposant une expérience ludique et éducative. Cette application permet :
- D’explorer une carte interactive avec des zones et des repères spécifiques pour les champignons.
- De collecter des badges en accomplissant des missions.
- D’interagir avec une communauté partageant des découvertes et des conseils.

Mushroom GO vise à rendre la mycologie accessible à tous, que vous soyez débutant ou passionné.

---

## 🔍 Étude de l’existant

| Application           | Points forts                                      | Points faibles                                       |
|-----------------------|---------------------------------------------------|-----------------------------------------------------|
| **Seek**              | - Identification automatique avec photo.         | - Peu d'interactivité.                             |
| **Mushroom Identify** | - Base de données riche.                         | - Interface vieillissante et peu intuitive.        |
| **Shroomify**         | - Informations sur la toxicité des champignons.  | - Pas de carte interactive ou de missions.         |

Ces applications couvrent certains besoins d’identification, mais Mushroom GO se démarque par sa carte interactive, ses missions gamifiées et son approche communautaire.

---

## 👥 Public cible

### Personas :
- **Marie**, 26 ans, randonneuse occasionnelle, cherche à identifier les champignons trouvés lors de ses balades.
- **Julien**, 40 ans, passionné de mycologie, utilise l’application pour cartographier ses découvertes.
- **Claire**, 32 ans, mère de deux enfants, souhaite transformer leurs sorties en forêts en une activité éducative.

### Prise en compte du public :
- Interface intuitive et design attractif.
- Mode hors-ligne pour les zones sans réseau.
- Gamification pour motiver les utilisateurs à explorer et apprendre.

---

## ✨ Fonctionnalités principales

### Récits utilisateurs :
- **En tant que randonneur**, je veux pouvoir ajouter un repère sur la carte pour signaler une zone intéressante, afin de me souvenir de mes découvertes.
- **En tant qu’utilisateur novice**, je veux identifier un champignon à partir d’une photo pour connaître rapidement s’il est comestible.
- **En tant que collectionneur**, je veux obtenir des badges lorsque je réussis une mission, afin de motiver ma progression.

---

## 🚧 État d’avancement

| Fonctionnalité                     | État       | Illustration          |
|------------------------------------|------------|------------------------|
| Carte interactive                  | En cours   | GIF à ajouter          |
| Ajout de repères                   | En cours   | GIF à ajouter          |
| Collecte de badges                 | Terminé    | Image à ajouter        |
| Page de détails des badges         | Terminé    | Capture à ajouter      |

---

## 📖 Guide pour développeurs

### Prérequis :
- **Flutter SDK** : Version 3.5.4 ou supérieure.
- **Dépendances** :
    - `flutter_map`: Affiche la carte interactive.
    - `latlong2`: Gestion des coordonnées géographiques.
    - `intl`: Formatage des dates.
- **Clé API** :
    - Si vous utilisez Google Maps dans une future version, renseignez la clé dans `lib/config/api_keys.dart`.

### Étapes pour compiler :
1. Clonez le dépôt :
   ```bash
   git clone https://github.com/username/mushroom_go.git
   cd mushroom_go
