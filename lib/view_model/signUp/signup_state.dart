import 'package:flutter/foundation.dart';

@immutable
class SignUpState {
  final bool isLoading;
  final bool obscurePassword;
  final bool isSignedUp;

  final String? errorMessage;
  final String? successMessage;

  const SignUpState({
    this.isLoading = false,
    this.obscurePassword = true,
    this.isSignedUp = false,
    this.errorMessage,
    this.successMessage,
  });

  factory SignUpState.initial() {
    return const SignUpState();
  }

  SignUpState copyWith({
    bool? isLoading,
    bool? obscurePassword,
    bool? isSignedUp,
    String? errorMessage,
    String? successMessage,
    bool clearError = false,
    bool clearSuccess = false,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      obscurePassword:
      obscurePassword ?? this.obscurePassword,
      isSignedUp: isSignedUp ?? this.isSignedUp,
      errorMessage:
      clearError ? null : (errorMessage ?? this.errorMessage),
      successMessage:
      clearSuccess
          ? null
          : (successMessage ?? this.successMessage),
    );
  }
}