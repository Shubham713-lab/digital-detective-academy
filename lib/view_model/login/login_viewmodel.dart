import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/firebase_service.dart';
import 'login_state.dart';

final loginProvider =
StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(FirebaseService());
});

class LoginViewModel extends StateNotifier<LoginState> {
  final FirebaseService _firebaseService;

  LoginViewModel(this._firebaseService) : super(LoginState.initial());

  void togglePasswordVisibility() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  bool validateEmail(String email) {
    if (email.trim().isEmpty) {
      state = state.copyWith(
        errorMessage: "Email cannot be empty.",
        clearSuccess: true,
      );
      return false;
    }

    final emailRegex = RegExp(
      r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(email.trim())) {
      state = state.copyWith(
        errorMessage: "Please enter a valid email address.",
        clearSuccess: true,
      );
      return false;
    }

    return true;
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      state = state.copyWith(
        errorMessage: "Password cannot be empty.",
        clearSuccess: true,
      );
      return false;
    }

    if (password.length < 6) {
      state = state.copyWith(
        errorMessage: "Password must be at least 6 characters.",
        clearSuccess: true,
      );
      return false;
    }

    return true;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!validateEmail(email) || !validatePassword(password)) {
      return;
    }

    state = state.copyWith(
      isLoading: true,
      clearError: true,
      clearSuccess: true,
    );

    try {
      final user = await _firebaseService.signUp(
        email.trim(),
        password.trim(),
      );

      if (user != null) {
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: true,
          successMessage: "Login successful!",
          clearError: true,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: "Login failed.",
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case "invalid-email":
          message = "Invalid email address.";
          break;

        case "user-not-found":
          message = "No account found with this email.";
          break;

        case "wrong-password":
          message = "Incorrect password.";
          break;

        case "invalid-credential":
          message = "Invalid email or password.";
          break;

        case "user-disabled":
          message = "This account has been disabled.";
          break;

        case "too-many-requests":
          message =
          "Too many login attempts. Please try again later.";
          break;

        case "network-request-failed":
          message = "No internet connection.";
          break;

        default:
          message = e.message ?? "Login failed.";
      }

      state = state.copyWith(
        isLoading: false,
        errorMessage: message,
      );
    } on SocketException {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "No internet connection.",
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "Something went wrong. Please try again.",
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void clearSuccess() {
    state = state.copyWith(clearSuccess: true);
  }

  void logout() {
    state = LoginState.initial();
  }
}