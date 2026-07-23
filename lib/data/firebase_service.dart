import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // Submit Feedback
  Future<void> submitFeedback({
    required String name,
    required String email,
    required String subject,
    required String feedback,
    required int rating,
  }) async {
    try {
      // Get currently logged-in user
      final user = _auth.currentUser;

      if (user == null) {
        throw Exception(
          "You must be logged in to submit feedback.",
        );
      }

      // Generate unique feedback ID
      final feedbackRef =
      _database.ref("Feedback").push();

      // Save feedback
      await feedbackRef.set({
        "feedbackId": feedbackRef.key,
        "userId": user.uid,
        "name": name.trim(),
        "email": email.trim(),
        "subject": subject.trim(),
        "feedback": feedback.trim(),
        "rating": rating,
        "createdAt": ServerValue.timestamp,
      });
    } on FirebaseException catch (e) {
      throw Exception(
        e.message ?? "Failed to submit feedback.",
      );
    } catch (_) {
      rethrow;
    }
  }
  // Sign Up with Email and Password
  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential credential =
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException {
      // Pass Firebase errors to the ViewModel
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  // Login with Email and Password
  Future<User?> register(String email, String password, String name,) async {
    try {
      final UserCredential credential =
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final User? user = credential.user;
      if (user == null) {
        throw Exception("Registration failed.");
      }
      await _database
          .ref()
          .child("Users")
          .child(user.uid)
          .set({
        "name": name.trim(),
        "email": email.trim(),
        "userId": user.uid,
        "createdAt": ServerValue.timestamp,
      });

      return user;
    } on FirebaseAuthException {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}