# ⚽ PX League

**PX League** is a modern Flutter application that provides real-time football (soccer) league updates — including match results, leaderboards, tournaments, and player insights.  
It integrates **Firebase Authentication**, **Firestore**, **Hive caching**, and **third-party login (Google & Facebook)**, offering a seamless, data-driven sports experience.

---
## 📸 Screenshots

### 📱 Onboarding Experienc

<img width="414" height="896" alt="3" src="https://github.com/user-attachments/assets/6f8baff0-e5ce-45b2-bb2d-996a94f684e8" />
<img width="414" height="896" alt="2" src="https://github.com/user-attachments/assets/ae6e6ddf-77b3-4160-b678-108be53614df" />
<img width="414" height="896" alt="1" src="https://github.com/user-attachments/assets/8806b6a5-fe84-4216-bac9-c657c7bcd0fe" />
<img width="414" height="896" alt="4" src="https://github.com/user-attachments/assets/acd3e0ba-d426-4aee-bca3-e93fb8de85b2" />

### 👤 Authentication System

<img width="414" height="896" alt="6" src="https://github.com/user-attachments/assets/4db4fd24-7b61-4dee-b29a-1e52b7d837d9" />
<img width="414" height="896" alt="5" src="https://github.com/user-attachments/assets/9b6051d7-c7be-4ac1-a550-d6ddd16f0329" />
<img width="414" height="896" alt="7" src="https://github.com/user-attachments/assets/88a7205a-a24c-4d66-9c69-7a3d5a52b1d8" />

### 🏆 League & Matches

<img width="414" height="896" alt="9" src="https://github.com/user-attachments/assets/ce210b00-28b5-4306-9759-002f85952400" />
<img width="414" height="896" alt="8" src="https://github.com/user-attachments/assets/65fe979d-20d0-4dca-9b44-abe03b10dea9" />
<img width="414" height="896" alt="10" src="https://github.com/user-attachments/assets/27fa154e-569c-494c-b0f7-51a2efa153bd" />
<img width="414" height="896" alt="12" src="https://github.com/user-attachments/assets/1d268e18-5d00-4f5b-b52d-9198664f54c5" />
<img width="414" height="896" alt="11" src="https://github.com/user-attachments/assets/cffb2c12-b795-4e34-b3d8-b7fbb0a6ee7b" />
<img width="414" height="896" alt="14" src="https://github.com/user-attachments/assets/d58f9b8c-165f-4866-b942-61b91ce9b3d7" />
<img width="414" height="896" alt="13" src="https://github.com/user-attachments/assets/1d35cedc-80ca-42d6-bd9b-5fc44ec85a5f" />
<img width="414" height="896" alt="16" src="https://github.com/user-attachments/assets/b059aa43-fb4a-4d47-ae2a-2231f95973e0" />
<img width="414" height="896" alt="15" src="https://github.com/user-attachments/assets/2d9382f0-bc82-4e27-94fd-382fd1a24d72" />

### 🧑‍💼 User Profile

<img width="414" height="896" alt="17" src="https://github.com/user-attachments/assets/045c3d69-823a-4e68-be9d-98f744177cbb" />
<img width="414" height="896" alt="18" src="https://github.com/user-attachments/assets/b80c08b6-6280-41f8-adb8-22c7ee3bdb41" />

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
