
📰 Flutter News App
A Flutter mobile application that fetches and displays news articles from a public REST API. Built as part of a technical task to demonstrate skills in Flutter, GetX state management, Firebase Authentication, and responsive UI design.

📲 Features
✅ Firebase Authentication

Login via Email/Password


✅ News Feed

Fetches articles from a public REST API

Displays headlines, images, descriptions, and full article details

✅ Search

Search articles by keyword

✅ Responsive UI

Optimized layouts for various screen sizes

Custom ResponsiveConfig ensures spacing, padding, and sizing adapt fluidly

✅ State Management

Implemented using GetX for:

Reactive UI updates

Navigation

Controller logic

🚀 Getting Started
✅ Prerequisites
Flutter SDK (v3.0 or above recommended)

Firebase project configured

Android Studio / VSCode

A real device or emulator

🔧 Setup Instructions
Clone the repository:

bash
Copy
Edit
git clone https://github.com/AmmarAlhasan/Flutter-News-App.git
cd flutter-news-app
Install dependencies:

bash
Copy
Edit
flutter pub get
Setup Firebase:

Add your google-services.json (Android) and GoogleService-Info.plist (iOS)

Enable Authentication > Sign-in methods in Firebase console

Run the app:

bash
Copy
Edit
flutter run
🛠 Architecture & Implementation
State Management: GetX

Lightweight, reactive approach to manage view logic and navigation

REST API: NewsAPI.org

Articles are fetched using an HTTP client

Parsing is done using models

Authentication:

FirebaseAuth handles login/signup

Abstracted into LoginService class

Search:

Users can search headlines in real-time

UI Layer:

CustomField, PasswordField, and responsive spacing ensure clean UI

ResponsiveConfig dynamically adjusts layout based on screen size

🎥 Demo
📽 Watch the recorded demo here: https://drive.google.com/file/d/19MlcCklsb2sMLy8ZrhpvVQVtidETWFAv/view?usp=drivesdk


🧪 Testing & Validation
✅ Email/Password login flow tested with Firebase

✅ API integration returns valid JSON responses

✅ Search articles in real time

✅ Layout adapts across emulators with different screen sizes