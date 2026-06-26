# 🏥 Sprint Hosto

Sprint Hosto est une application mobile de santé développée avec **Flutter** et **Material 3**. Elle permet aux utilisateurs (patients et médecins) de gérer les prises de rendez-vous, de rechercher des professionnels de santé et d'accéder à un suivi médical personnalisé.

## 🚀 Fonctionnalités principales

*   **Onboarding Fluide** : Écrans d'introduction animés avec indicateurs visuels (`smooth_page_indicator`).
*   **Système d'Authentification Hybride** : Connexion et inscription adaptées selon le rôle choisi (**Patient** ou **Médecin**).
*   **Sécurité & Validation** : Validation complète des formulaires (format email, force du mot de passe, correspondance des mots de passe).
*   **Récupération de Compte** : Flux complet de réinitialisation de mot de passe avec validation par code OTP reçu par email.
*   **Design Moderne & Uniforme** : Thémisation globale unifiée avec Material 3, ombres portées (`BoxShadow`) élégantes et police Google Fonts (Poppins & Inter).

## 🛠️ Architecture du Projet (Dossiers)

L'application suit une structure modulaire par fonctionnalités (`features/screens`) pour une meilleure scalabilité :

```text
lib/
│
├── screens/
│   ├── onboarding/             # Écrans d'introduction
│   ├── login_screens/          # Écran de connexion (Login)
│   ├── sign_in_screen/         # Écran d'inscription (Register)
│   └── forget_key_screen/      # Flux de récupération (Email, OTP, Nouveau mot de passe)
│
├── widget/                     # Composants UI réutilisables (Boutons personnalisés)
│   ├── custom_elevated_button.dart
│   ├── custom_outlined_button.dart
│   └── custom_text_button.dart
│
├── utile/                      # Fichiers de configuration globaux
│   └── colors.dart             # Palette de couleurs de la charte graphique
│
└── main.dart                   # Point d'entrée & configuration des thèmes et routes
```

## 🗺️ Système de Navigation

Le projet intègre une gestion hybride de la navigation pour répondre à tous les cas d'usage :
1.  **Routes Anonymes (Navigator 1.0)** : `Navigator.push()` pour les flux temporaires.
2.  **Routes Nommées** : Déclarées centralement dans le `main.dart` (`/login`, `/register`, etc.) pour un code propre.
3.  **Navigation Déclarative (Navigator 2.0)** : Structure prête pour une intégration avancée basée sur les états.

## 💻 Installation et Démarrage

### Prérequis
*   Flutter SDK (version 3.35.0 ou supérieure recommandée)
*   Dart SDK
*   Un émulateur ou un appareil physique (ex: TECNO) connecté

### Étapes d'installation

1.  **Cloner le dépôt** :
    ```bash
    git clone https://github.com
    cd sprint_hosto
    ```

2.  **Nettoyer le cache et installer les dépendances** :
    ```bash
    flutter clean
    flutter pub get
    ```

3.  **Lancer l'application** (en mode debug) :
    ```bash
    flutter run
    ```

## 📦 Dépendances principales utilisées

*   `flutter_native_splash` : Gestion de l'écran de démarrage natif (durée de 3 secondes).
*   `google_fonts` : Intégration des polices *Poppins* et *Inter*.
*   `smooth_page_indicator` : Indicateurs de pages personnalisés pour l'onboarding.

---
🎨 *Développé avec soin pour offrir une expérience utilisateur fluide et sécurisée dans le domaine de la santé.*
