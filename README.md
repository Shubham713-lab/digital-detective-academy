# 🕵️ Digital Detective Academy

A story-based **Cybersecurity Learning Application** built using **Flutter** and **Firebase** that transforms cybersecurity education into an engaging detective adventure. Users solve realistic cybercrime investigations while learning cybersecurity concepts through interactive scenarios, quizzes, and progressive case-based learning.

---

# 📖 Project Vision

Digital Detective Academy gamifies cybersecurity education by allowing learners to investigate cybercrime cases, solve security challenges, and strengthen their cybersecurity knowledge through immersive storytelling.

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
- 🏆 Performance Tracking
- 👤 User Profile
- 📊 Learning Progress Monitoring
- 🔒 Sequential Level Unlocking
- 🎨 Modern Cyber-Themed UI

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

## 1️⃣ Splash Screen

The Splash Screen serves as the entry point of the application. It displays the Detective Academy logo with a cyber-themed interface while initializing the application before navigating to authentication.

<p align="center">
<img src="screenshots/Splash%20Screen.png" width="300"/>
</p>

---

## 2️⃣ Login Screen

Allows registered users to securely log in using Firebase Authentication.

### Features

- Email Authentication
- Password Authentication
- Firebase Login
- Navigation to Registration

<p align="center">
<img src="screenshots/Login%20Screen.png" width="300"/>
</p>

---

## 3️⃣ Sign Up Screen

New users can create an account using Firebase Authentication and Cloud Firestore.

### Features

- User Registration
- Firebase Authentication
- Cloud Firestore Integration

<p align="center">
<img src="screenshots/Sign%20Up%20Screen.png" width="300"/>
</p>

---

## 4️⃣ Home Dashboard

Provides an overview of the learner's progress and recent investigations.

### Displays

- XP
- Badges
- Completed Cases
- Recent Activity
- Start Investigation

<p align="center">
<img src="screenshots/Home%20Dashboard.png" width="300"/>
</p>

---

## 5️⃣ Courses Screen

Displays available cybersecurity investigation courses that users can choose to begin their learning journey.

### Features

- Course Listing
- Investigation Categories
- Course Navigation

<p align="center">
<img src="screenshots/Courses%20Screen.png" width="300"/>
</p>

---

## 6️⃣ Briefing Screen

Provides the mission briefing, operational details, and cybercrime scenario before starting an investigation.

### Displays

- Mission Title
- Investigation Scenario
- Case Description
- Investigation Details

<p align="center">
<img src="screenshots/Briefing%20Screen.png" width="300"/>
</p>

---

## 7️⃣ Levels Screen

Each investigation contains multiple levels that unlock sequentially as users progress.

### Features

- Sequential Progression
- Locked Levels
- Completed Levels
- Progress Tracking

<p align="center">
<img src="screenshots/Levels%20Screen.png" width="300"/>
</p>

---

## 8️⃣ Question Screen

Interactive multiple-choice questions allow learners to analyze cybersecurity scenarios and complete investigations.

### Features

- Multiple Choice Questions
- Hint System
- Progress Indicator
- Answer Submission

<p align="center">
<img src="screenshots/Question%20Screen.png" width="300"/>
</p>

---

## 9️⃣ Result Screen

Displays the learner's performance after completing a level.

### Displays

- Final Score
- Accuracy
- Correct Answers
- Investigation Result

<p align="center">
<img src="screenshots/Result%20Screen.png" width="300"/>
</p>

---

## 🔟 Profile Screen

Displays user information, achievements, and learning statistics.

### Displays

- Investigator Name
- Rank
- Cases Solved
- Accuracy
- Achievement Gallery
- Account Settings
- Privacy & Security

<p align="center">
<img src="screenshots/Profile%20Screen.png" width="300"/>
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
Dashboard
```

---

# 🔥 Firebase Services Used

- Firebase Authentication
- Cloud Firestore

---

# 🚀 Future Enhancements

- 🏆 Leaderboards
- 🎖 Achievement System
- 🔔 Push Notifications
- 👨‍💼 Admin Dashboard
- 📈 Analytics Dashboard
- 🌐 Offline Learning
- 🔊 Sound Effects
- 📅 Daily Challenges

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
