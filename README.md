# Application d'Émissions de Streaming - Version MVC

Projet développé en Flutter dans le cadre de l'Activité 1 (Développement Mobile - Niveau Approfondi).
Cette application affiche une liste d'émissions de streaming sous forme de grille réactive et permet d'accéder aux détails de chaque émission selon l'architecture Modèle - Vue - Contrôleur (MVC).

# Répartition des Responsabilités (Architecture MVC)

## Modèle (`lib/models/`)
Contient uniquement les données et la logique métier. **Aucun import `package:flutter/material.dart` n'est présent dans ce dossier.**
- **`emission.dart`** : Définition de la classe `Emission` (id, nom, chaîne radio, imagePath, diffusions).
- **`diffusion.dart`** : Définition de la classe `Diffusion` et méthode statique métier `generateRandomDiffusions()` pour générer des dates de diffusion aléatoires.

##  Contrôleur (`lib/controllers/`)
Sert d'intermédiaire entre les Modèles et les Vues.
**`emission_controller.dart`** : Initialise la liste des émissions (`loadEmissions()`) et la met à disposition des Vues via `getEmissions()`.

## Vue (`lib/views/`)
Gère l'affichage graphique et les interactions utilisateur sans effectuer de calculs métiers.
**`home_page.dart`** : Page principale affichant l'AppBar, la grille réactive et la BottomNavigationBar.
**`carte_emission.dart`** : Widget personnalisé pour afficher chaque carte d'émission dans la grille avec une animation `Hero`.
**`detail_page.dart`** : Page de détail affichant l'image agrandie et la liste des dates de diffusion.

---

##  Comment Exécuter et Tester l'Application

## Prérequis
1.Flutter SDK installé et configuré.
2.Un émulateur Android/iOS ou un appareil physique connecté en mode USB Debugging.

### Étapes d'exécution
Dans votre 

Récupérer les dépendances :

   flutter pub get
puis lancer 

flutter run

## Packages et Dépendances Utilisés
flutter/material.dart : Interface graphique Material Design.

responsive_grid : Affichage responsive de la grille d'émissions.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
