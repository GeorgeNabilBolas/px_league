# ⚽ PX League

**PX League** is a modern Flutter application that provides real-time football (soccer) league updates — including match results, leaderboards, tournaments, and player insights.  
It integrates **Firebase Authentication**, **Firestore**, **Hive caching**, and **third-party login (Google & Facebook)**, offering a seamless, data-driven sports experience.

---
## 📸 Screenshots
<img width="414" height="896" alt="18" src="https://github.com/user-attachments/assets/389633a3-76f3-4db2-9221-d9a2a8cbbe7b" />
<img width="414" height="896" alt="17" src="https://github.com/user-attachments/assets/9e73a351-be50-47ca-92e0-d35c5f41ae3f" />
<img width="414" height="896" alt="16" src="https://github.com/user-attachments/assets/1707da88-9109-430e-8e65-58514915af08" />
<img width="414" height="896" alt="15" src="https://github.com/user-attachments/assets/9403e80b-72f8-479f-a8db-9521da370765" />
<img width="414" height="896" alt="14" src="https://github.com/user-attachments/assets/c682343a-245a-419f-8b58-6c829c8eba0d" />
<img width="414" height="896" alt="13" src="https://github.com/user-attachments/assets/c92b8981-6c0e-40cd-b303-34b9b50f70b9" />
<img width="414" height="896" alt="12" src="https://github.com/user-attachments/assets/8cc9565f-c56d-41a5-a227-797f1fb6763c" />
<img width="414" height="896" alt="11" src="https://github.com/user-attachments/assets/2ee53526-9737-453f-a83b-a47bc83e3dc1" />
<img width="414" height="896" alt="10" src="https://github.com/user-attachments/assets/6014e975-e12b-4491-adda-f6850b7076fe" />
<img width="414" height="896" alt="9" src="https://github.com/user-attachments/assets/7a8e4afc-a19d-46c0-9eee-06158fa47a26" />
<img width="414" height="896" alt="8" src="https://github.com/user-attachments/assets/3c0ad85e-68e2-46f7-b42b-7f6330462fee" />
<img width="414" height="896" alt="7" src="https://github.com/user-attachments/assets/3eb5cb5f-ecab-462b-a907-3995e00b6ec8" />
<img width="414" height="896" alt="6" src="https://github.com/user-attachments/assets/feed59ee-45bf-4a02-8b5c-7443e7b02b97" />
<img width="414" height="896" alt="5" src="https://github.com/user-attachments/assets/cb3307aa-99d5-497a-90be-2cb20790f9b8" />
<img width="414" height="896" alt="4" src="https://github.com/user-attachments/assets/f46f8647-eae3-4b3e-9b39-f1e59a6a592a" />
<img width="414" height="896" alt="3" src="https://github.com/user-attachments/assets/95186049-53d7-4f8a-a8f2-27e7b3b48122" />
<img width="414" height="896" alt="2" src="https://github.com/user-attachments/assets/dc250c4e-f89e-44e5-9e64-6b97f3d77166" />
<img width="414" height="896" alt="1" src="https://github.com/user-attachments/assets/0425ba62-7789-425a-b39a-74dc96d05641" />

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
