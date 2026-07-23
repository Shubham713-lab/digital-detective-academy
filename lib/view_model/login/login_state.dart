import 'package:flutter/foundation.dart';

@immutable
class LoginState {
  final bool isLoading;
  final bool isLoggedIn;
  final bool obscurePassword;
  final String? errorMessage;
  final String? successMessage;

  const LoginState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.obscurePassword = true,
    this.errorMessage,
    this.successMessage,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    bool? obscurePassword,
    String? errorMessage,
    String? successMessage,
    bool clearError = false,
    bool clearSuccess = false,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      errorMessage:
      clearError ? null : (errorMessage ?? this.errorMessage),
      successMessage:
      clearSuccess ? null : (successMessage ?? this.successMessage),
    );
  }

  factory LoginState.initial() {
    return const LoginState();
  }
}