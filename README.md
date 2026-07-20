# 🕵️ Digital Detective Academy

A story-based **Cybersecurity Learning Application** built using **Flutter** and **Firebase** that transforms cybersecurity education into an engaging detective adventure. Users solve realistic cybercrime investigations while learning cybersecurity concepts through interactive scenarios, quizzes, and progressive case-based learning.

---

# 📖 Project Vision

Digital Detective Academy gamifies cybersecurity education by allowing learners to investigate cybercrime cases, solve security challenges, and strengthen their cybersecurity knowledge through immersive storytelling and practical investigations.

---

# 🎯 Objectives

- Learn cybersecurity through interactive investigations
- Solve real-world cybercrime scenarios
- Build practical cybersecurity awareness
- Track learning progress and achievements
- Encourage continuous learning through gamification

---

# 👥 Target Users

- Students
- Computer Science Learners
- Cybersecurity Enthusiasts
- Educators
- Beginners interested in Cybersecurity

---

# ✨ Features

- 🔐 Firebase Authentication
- 👤 User Registration & Login
- 📚 Cybersecurity Investigation Courses
- 🕵️ Story-Based Learning
- 📖 Investigation Briefings
- 🎯 Level-Based Progression
- ❓ Interactive Multiple Choice Questions
- 🏆 Result & Performance Tracking
- 👤 User Profile Management
- 📊 Progress Monitoring
- 🔒 Sequential Level Unlocking
- 🎨 Modern Cyber-Themed User Interface

---

# 🛠 Technology Stack

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Android Studio

---

# 📂 Project Structure

```text
lib/
│
├── core/
├── models/
├── services/
├── screens/
│   ├── splash/
│   ├── authentication/
│   ├── dashboard/
│   ├── courses/
│   ├── briefing/
│   ├── levels/
│   ├── questions/
│   ├── results/
│   └── profile/
│
├── widgets/
├── providers/
└── main.dart
```

---

# 📱 Application Modules

## 1. Splash Screen

The Splash Screen serves as the entry point of the application. It displays the Detective Academy logo with a cyber-themed interface while initializing required services before navigating to the authentication flow.

---

## 2. Login Screen

Allows registered users to securely sign in using Firebase Authentication. Users can log in with their email and password or navigate to the Sign Up screen to create a new account.

### Features

- Email Authentication
- Password Authentication
- Firebase Login
- Navigation to Registration

---

## 3. Sign Up Screen

Enables new users to create an account by entering their name, email, and password. User information is securely stored using Firebase Authentication and Cloud Firestore.

### Features

- User Registration
- Firebase Authentication
- Cloud Firestore Integration

---

## 4. Home Dashboard

Provides an overview of the user's learning journey and investigation progress.

### Displays

- Experience Points (XP)
- Earned Badges
- Completed Investigations
- Recent Activity
- Quick Start Investigation Button

---

## 5. Courses Screen

Displays available cybersecurity investigation courses with their titles and descriptions, allowing learners to choose different cybersecurity learning paths.

### Features

- Course Listing
- Investigation Categories
- Course Navigation

---

## 6. Briefing Screen

Introduces the selected investigation by presenting an operational briefing, mission overview, and detailed cybercrime scenario before the investigation begins.

### Displays

- Mission Title
- Investigation Scenario
- Case Description
- Investigation Details

---

## 7. Levels Screen

Each investigation is divided into multiple levels representing different stages of the cyber investigation. Locked, unlocked, and completed levels are visually distinguished.

### Features

- Sequential Progression
- Locked Levels
- Completed Levels
- Progress Tracking

---

## 8. Question Screen

Users solve investigation challenges by answering interactive multiple-choice cybersecurity questions based on the current case.

### Features

- Multiple Choice Questions
- Progress Indicator
- Hint System
- Answer Submission

---

## 9. Result Screen

Displays the user's performance after completing an investigation level.

### Displays

- Final Score
- Correct Answers
- Accuracy Percentage
- Investigation Result
- Continue Button

---

## 10. Profile Screen

Displays the user's investigation profile and overall learning statistics.

### Information Displayed

- User Name
- Investigator Rank
- Cases Solved
- Accuracy Percentage
- Achievements
- Account Settings
- Privacy & Security
- Achievement Gallery

---

# 📸 Application Screens

<p align="center">
  <img src="screenshots/Splash%20Screen.png" width="220"/>
  <img src="screenshots/Login%20Screen.png" width="220"/>
  <img src="screenshots/Sign%20Up%20Screen.png" width="220"/>
</p>

<p align="center">
  <img src="screenshots/Home%20Dashboard.png" width="220"/>
  <img src="screenshots/Courses%20Screen.png" width="220"/>
  <img src="screenshots/Briefing%20Screen.png" width="220"/>
</p>

<p align="center">
  <img src="screenshots/Levels%20Screen.png" width="220"/>
  <img src="screenshots/Question%20Screen.png" width="220"/>
</p>

<p align="center">
  <img src="screenshots/Result%20Screen.png" width="220"/>
  <img src="screenshots/Profile%20Screen.png" width="220"/>
</p>

---

# 🔄 Navigation Flow

```text
Splash Screen
       │
       ▼
Login / Sign Up
       │
       ▼
Home Dashboard
       │
       ▼
Courses
       │
       ▼
Investigation Briefing
       │
       ▼
Levels
       │
       ▼
Question Screen
       │
       ▼
Result Screen
       │
       ▼
Next Level / Dashboard
```

---

# 🔥 Firebase Services Used

- Firebase Authentication
- Cloud Firestore

---

# 🚀 Future Enhancements

- 🏆 Leaderboard System
- 📅 Daily Cyber Challenges
- 🎖 Achievement & Reward System
- 🔔 Push Notifications
- 👨‍💼 Admin Dashboard
- 🎯 Difficulty Levels
- 🔊 Sound Effects & Background Music
- 📈 Advanced User Analytics
- 🌐 Offline Learning Support

---

# 👨‍💻 Developed With

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Android Studio

---

# 📄 License

This project was developed for educational purposes to promote cybersecurity awareness through interactive, story-driven, and gamified learning experiences.
