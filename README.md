# Meal Recommendations

The Meal Recommendation App is a Flutter-based application designed to help users discover meals tailored to their preferences. By leveraging Firebase for authentication and the Gemini AI model for meal recommendations, the app provides users with personalized meal suggestions along with a list of ingredients.

## Table of contents 📑

- ### [Main Packages Used =>](#main-packages-used)
- ### [Folder Structure =>](#folder-structure)
- ### [App Link =>](#app-link)
- ### [Screen Shots =>](#screen-shots)

## Main Packages Used 🛠

- [bloc](https://pub.dev/packages/bloc) -> For state management with predictable patterns.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) -> To interact with Firestore database for real-time data storage.
- [conditional_builder_null_safety](https://pub.dev/packages/conditional_builder_null_safety) -> To build widgets conditionally with null safety.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) -> Provides icons consistent with iOS design.
- [dartz](https://pub.dev/packages/dartz) -> Functional programming utilities, including Either type for error handling.
- [either_dart](https://pub.dev/packages/either_dart) -> For handling errors and managing success/failure states effectively.
- [equatable](https://pub.dev/packages/equatable) -> Simplifies equality comparisons for Dart objects.
- [device_preview](https://pub.dev/packages/device_preview) -> For testing the app on different devices and screen sizes.
- [firebase_auth](https://pub.dev/packages/firebase_auth) -> Provides authentication services using Firebase.
- [firebase_core](https://pub.dev/packages/firebase_core) -> Core functionalities for Firebase integration in Flutter.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) -> Integrates bloc for managing application state efficiently.
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) -> For storing sensitive data securely in key-value pairs.
- [flutter_svg](https://pub.dev/packages/flutter_svg) -> To render SVG images directly in Flutter.
- [get_it](https://pub.dev/packages/get_it) -> A service locator for dependency injection.
- [go_router](https://pub.dev/packages/go_router) -> To manage navigation and routing in Flutter apps.
- [google_sign_in](https://pub.dev/packages/google_sign_in) -> Provides Google Authentication integration.
- [modal_progress_hud_nsn](https://pub.dev/packages/modal_progress_hud_nsn) -> Displays a modal progress indicator during async tasks.
- [pin_code_fields](https://pub.dev/packages/pin_code_fields) -> Customizable PIN code input fields for authentication flows.
- [shared_preferences](https://pub.dev/packages/shared_preferences) -> Persistent storage for simple key-value pairs.
- [firebase_storage](https://pub.dev/packages/firebase_storage) -> For uploading and retrieving files from Firebase Storage.
- [path](https://pub.dev/packages/path) -> Utilities for working with file paths.
- [image_picker](https://pub.dev/packages/image_picker) -> To pick images from the gallery or camera.
- [flutter_gemini](https://pub.dev/packages/flutter_gemini) -> Provides Gemini AI integration for advanced features like meal recommendations.

## Folder Structure 📂

Here is the folder structure we have been using in this project:

```
lib
├── core
├── features
├── firebase_options.dart
└── main.dart
```

### Core

This folder contains all services and tools related to the application

```
core
├── bloc_observer
├── errors
├── helper
├── network
├── services
├── utils
└── widgets
```

### Features

This folder containes everything related to the screen of the application and the business logic of the application specificly state management.

```
features
├── auth: Handles user authentication, including email/password sign-up and login, Google sign-in, and authentication state management.
├── fav_screen: Displays a list of favorite meals saved by the user, allowing them to view, manage, and remove their favorite items.
├── gemini_integrate: Integrates with the Gemini AI model to provide personalized meal recommendations and detailed ingredient lists.
├── home: The main screen of the app where users can browse recommended meals, view categories, and explore featured content.
├── meal_details: Shows detailed information about a selected meal, including its ingredients, preparation steps, duration and nutritional information.
├── onboarding: Introduces new users to the app with a guided walkthrough of its key features and functionalities.
├── profile: Allows users to manage their account details and password.
├── side_bar: Provides a navigation menu for accessing various app sections, including Home, Profile, Favorites, and Settings.
└── splash_boarding: The initial splash screen that welcomes users to the app and handles navigation to the onboarding or home screen based on their login status.

```

# [App Link](https://drive.google.com/file/d/1zkeRPrbrlrFStFFRvlFzSsEnP-5XSJGO/view?usp=sharing)

## Screen Shots 📸

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/1.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/2.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/3.PNG" width="300">

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/4.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/5.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/6.PNG" width="300">

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/7.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/8.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/9.PNG" width="300">

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/10.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/11.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/12.PNG" width="300">

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/13.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/14.PNG" width="300"><img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/15.PNG" width="300">

<img src="https://github.com/Mohamedihab29592/meal-recommendation-A2/blob/screen_shots/screen_shots/16.PNG" width="300">
