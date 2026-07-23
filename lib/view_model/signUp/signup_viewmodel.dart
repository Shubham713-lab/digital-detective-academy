import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/firebase_service.dart';
import 'signup_state.dart';

final signUpProvider =
StateNotifierProvider<SignUpViewModel, SignUpState>(
      (ref) => SignUpViewModel(FirebaseService()),
);

class SignUpViewModel extends StateNotifier<SignUpState> {
  final FirebaseService _firebaseService;

  SignUpViewModel(this._firebaseService)
      : super(SignUpState.initial());

  void togglePasswordVisibility() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (name.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: "Name cannot be empty.",
      );
      return;
    }

    if (name.trim().length < 3) {
      state = state.copyWith(
        errorMessage:
        "Name must be at least 3 characters.",
      );
      return;
    }

    if (email.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: "Email cannot be empty.",
      );
      return;
    }

    final regex = RegExp(
      r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$',
    );

    if (!regex.hasMatch(email.trim())) {
      state = state.copyWith(
        errorMessage: "Enter a valid email.",
      );
      return;
    }

    if (password.isEmpty) {
      state = state.copyWith(
        errorMessage:
        "Password cannot be empty.",
      );
      return;
    }

    if (password.length < 6) {
      state = state.copyWith(
        errorMessage:
        "Password must be at least 6 characters.",
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      final user = await _firebaseService.register(
        email,
        password,
        name,
      );

      if (user != null) {
        state = state.copyWith(
          isLoading: false,
          isSignedUp: true,
          successMessage:
          "Account created successfully!",
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage:
          "Registration failed.",
        );
      }
    } on FirebaseAuthException catch (e) {
      String error;

      switch (e.code) {
        case "email-already-in-use":
          error =
          "This email is already registered.";
          break;

        case "invalid-email":
          error = "Invalid email.";
          break;

        case "weak-password":
          error =
          "Password should be at least 6 characters.";
          break;

        case "network-request-failed":
          error = "No internet connection.";
          break;

        case "too-many-requests":
          error =
          "Too many attempts. Please try again later.";
          break;

        default:
          error =
              e.message ?? "Registration failed.";
      }

      state = state.copyWith(
        isLoading: false,
        errorMessage: error,
      );
    } on SocketException {
      state = state.copyWith(
        isLoading: false,
        errorMessage:
        "No internet connection.",
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage:
        "Something went wrong.",
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void clearSuccess() {
    state = state.copyWith(clearSuccess: true);
  }
}