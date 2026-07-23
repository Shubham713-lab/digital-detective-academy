import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/firebase_service.dart';
import 'feedback_state.dart';

final feedbackProvider =
StateNotifierProvider<FeedbackViewModel, FeedbackState>(
      (ref) => FeedbackViewModel(),
);

class FeedbackViewModel
    extends StateNotifier<FeedbackState> {
  FeedbackViewModel() : super(const FeedbackState());

  final FirebaseService _firebaseService =
  FirebaseService();

  void updateRating(int rating) {
    state = state.copyWith(rating: rating);
  }

  void resetRating() {
    state = state.copyWith(rating: 0);
  }

  void clearSuccess() {
    state = state.copyWith(successMessage: null);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  Future<void> submitFeedback({
    required String name,
    required String email,
    required String subject,
    required String feedback,
    required int rating,
  }) async {
    state = state.copyWith(isLoading: true);

    try {
      await _firebaseService.submitFeedback(
        name: name,
        email: email,
        subject: subject,
        feedback: feedback,
        rating: state.rating,
      );

      state = state.copyWith(
        isLoading: false,
        successMessage:
        "Feedback submitted successfully.",
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}