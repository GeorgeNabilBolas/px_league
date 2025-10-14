# ⚽ PX League

**PX League** is a modern Flutter application that provides real-time football (soccer) league updates — including match results, leaderboards, tournaments, and player insights.  
It integrates **Firebase Authentication**, **Firestore**, **Hive caching**, and **third-party login (Google & Facebook)**, offering a seamless, data-driven sports experience.

---

## 🚀 Features

### 🏆 League & Matches
- Browse live and upcoming matches.
- Check teams, leagues, and match times.
- Offline match caching with Hive for faster reloads.

### 👤 Authentication System
- Email & password login.
- Google and Facebook sign-in.
- Reset and change password with Firebase Authentication.

### 📱 Onboarding Experience
- Interactive intro screens for first-time users.
- Dynamic navigation using **GoRouter**.

### 🧑‍💼 User Profile
- View and edit personal info.
- Logout, deactivate, or delete account securely.
- Manage statistics and preferences.

### 📄 App Policies
- Built-in **Privacy Policy** and **Terms & Conditions** screens.

### ⚙️ Architecture Highlights
- **Clean Architecture + Cubit (BLoC)** for state management.
- **Dependency Injection** via GetIt.
- **Dio** for network handling with clean exception management.
- **Hive** for secure local storage and caching.
- **Custom reusable UI components** for consistency and maintainability.

---

## 🧱 Project Structure

```
lib/
├── Core/
│   ├── constants/         # Colors, fonts, styles, paddings, durations
│   ├── di/                # Dependency injection setup
│   ├── errors/            # Firebase & network exception handling
│   ├── helpers/           # Utilities, dialogs, validators, and snackbars
│   ├── hive/              # Hive models, adapters, and registrars
│   ├── models/            # Shared data models
│   ├── networking/        # API & cache services
│   ├── routes/            # GoRouter configurations
│   ├── theme/             # App theming
│   └── widgets/           # Shared UI widgets
│
├── Features/
│   ├── auth/              # Login, sign-up, reset password
│   ├── onboarding/        # Intro screens
│   ├── today_matches_page/# Match details, league, and timing
│   ├── leaderboard_page/  # League standings
│   ├── tournaments_page/  # Tournament overview
│   ├── user_profile/      # Profile, statistics, and account control
│   ├── main_page/         # App main view and navigation bar
│   ├── privacy_policy/    # Privacy Policy view
│   └── terms_and_conditions/ # Terms and Conditions view
│
├── firebase_options.dart   # Firebase configuration
└── main.dart               # Entry point
```

---

## 🧩 Tech Stack

| Category | Packages |
|-----------|-----------|
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) |
| **Dependency Injection** | [get_it](https://pub.dev/packages/get_it) |
| **Routing** | [go_router](https://pub.dev/packages/go_router) |
| **Networking** | [dio](https://pub.dev/packages/dio) |
| **Caching** | [hive_ce](https://pub.dev/packages/hive_ce), [hive_ce_flutter](https://pub.dev/packages/hive_ce_flutter) |
| **Firebase** | firebase_core, firebase_auth, cloud_firestore |
| **Authentication** | google_sign_in, flutter_facebook_auth |
| **UI & Theming** | flutter_svg, flutter_screenutil |
| **Storage** | shared_preferences |
| **Connectivity** | internet_connection_checker_plus |
| **Utilities** | equatable, build_runner |

---

## ⚡ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/<your-username>/px_league.git
cd px_league
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Configuration
Add your Firebase setup files:
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

### 4. Run the App
```bash
flutter run
```

---

## 🧰 Optional: Generate a New Feature

You can generate a new feature structure using the built-in script:
```bash
dart run generate_structure.dart <feature_name>
```

Example:
```bash
dart run generate_structure.dart player_stats
```

This automatically creates:
```
lib/Features/player_stats/
  ├── data/
  └── presentation/
```

---

## 🖋 Developer Notes

- **Flutter SDK:** 3.9.0+
- **Font:** Cairo (Light → Black)
- **Architecture:** Clean, modular, scalable
- **Linting:** Enforced via `flutter_lints` (strict)
- **Build tools:** Custom splash screen, launcher icons

---

## 🧑‍💻 Author

**George Nabil**  
Electrical Engineer & Flutter Developer  
📧 george.nabil.bulis@gmail.com  

---

## 📄 License

This project is private and not published to pub.dev.  
You are free to modify and extend it for personal or educational use.

---
