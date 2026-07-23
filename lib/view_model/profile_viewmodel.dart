import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../data/firebase_service.dart';
import '../model/profile_model.dart';

class ProfileViewModel {
  final FirebaseService _firebaseService =
  FirebaseService();
  Future<ProfileModel> loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User is not logged in.");
    }

    final uid = user.uid;

    final snapshot = await FirebaseDatabase.instance
        .ref("Users/$uid")
        .get();

    if (!snapshot.exists) {
      throw Exception("Profile not found.");
    }

    final data = Map<String, dynamic>.from(
      snapshot.value as Map,
    );

    return ProfileModel(
      name: data["name"] ?? "Unknown User",
      email: data["email"] ?? "",
      designation: "Senior Investigator",
      image: "assets/images/profile.jpg",
      solvedCases: 12,
      accuracy: 94,
      rank: "Gold Sleuth",
    );
  }
  Future<void> logout() async {
    await _firebaseService.signOut();
  }
}