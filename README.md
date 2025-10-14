# ⚽ PX League

**PX League** is a modern Flutter application that provides football (soccer) league insights, match details, and leaderboard tracking — all wrapped in a clean, responsive UI.  
It integrates Firebase Authentication, Firestore, and third-party login (Google & Facebook), providing a full-featured sports platform experience.

---

## 🚀 Features

- 🏆 **League Standings & Matches**
  - View live and upcoming matches.
  - Check team logos, names, and match times.

- 👤 **User Authentication**
  - Email & password login.
  - Google and Facebook sign-in.
  - Forgot and reset password flow.

- 📱 **Onboarding Experience**
  - Beautiful intro screens for new users.

- 👨‍💻 **User Profile**
  - View and edit profile details.
  - Manage account settings and logout.
  - Delete or deactivate account securely.

- 🖼 **Image Picker Demo**
  - Choose and upload images for profile or posts.

- ⚙️ **Modern Architecture**
  - Clean, maintainable structure using **Cubit (BLoC)**.
  - Dependency injection with **GetIt**.
  - Network handling with **Dio**.
  - Firebase integration across all platforms.

---

## 🧱 Project Structure

```
lib/
├── Core/
│   ├── constants/         # App colors, paddings, text styles, etc.
│   ├── di/                # Dependency injection setup
│   ├── errors/            # Exception and error handling
│   ├── helpers/           # Utility helpers and validators
│   ├── models/            # Shared models
│   ├── networking/        # API services and results
│   ├── routes/            # App navigation and route config
│   ├── theme/             # App theming (light/dark)
│   └── widgets/           # Shared custom widgets
│
├── Features/
│   ├── auth/              # Login, Sign-up, Reset Password
│   ├── onboarding/        # Intro screens for new users
│   ├── today_matches_page/# Match details and cards
│   ├── leaderboard_page/  # League leaderboard
│   ├── user_profile/      # Profile and settings
│   └── tournaments_page/  # Tournament overview
│
├── firebase_options.dart   # Firebase configuration
└── main.dart               # Entry point
```

---

## 🧩 Tech Stack

| Category | Tools / Packages |
|-----------|------------------|
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) |
| **Dependency Injection** | [get_it](https://pub.dev/packages/get_it) |
| **Networking** | [dio](https://pub.dev/packages/dio) |
| **Firebase** | firebase_core, firebase_auth, cloud_firestore |
| **Authentication** | google_sign_in, flutter_facebook_auth |
| **UI & Theming** | flutter_svg, flutter_screenutil |
| **Local Storage** | shared_preferences |
| **Connectivity** | internet_connection_checker_plus |
| **Image Handling** | image_picker, cached_network_image |

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

### 3. Configure Firebase

Add your own Firebase configuration files:
- `google-services.json` → `android/app/`
- `GoogleService-Info.plist` → `ios/Runner/`

### 4. Run the App

```bash
flutter run
```

---

## 🧰 Generate Feature Structure (Optional)

A Dart utility script `generate_structure.dart` helps you create a new feature folder with all required layers:

```bash
dart run generate_structure.dart <feature_name>
```

Example:
```bash
dart run generate_structure.dart player_stats
```

This generates a full structure under `lib/Features/player_stats/`.

---

## 🖋 Developer Notes

- Minimum SDK: **Flutter 3.9.0+**
- Uses **Cairo** font family.
- Designed with clean architecture in mind.
- Follows **SOLID principles** and modular feature separation.

---

## 🧑‍💻 Author

**George Nabil**  
Electrical Engineer & Flutter Developer  
📧 *[Add your email or GitHub link here]*  

---

## 📄 License

This project is currently private and not published to pub.dev.  
You may freely modify or extend it for personal use.

---
