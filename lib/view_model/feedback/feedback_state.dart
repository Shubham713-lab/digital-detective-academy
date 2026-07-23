class FeedbackState {
  final bool isLoading;
  final int rating;
  final String? successMessage;
  final String? errorMessage;

  const FeedbackState({
    this.isLoading = false,
    this.rating = 0,
    this.successMessage,
    this.errorMessage,
  });

  FeedbackState copyWith({
    bool? isLoading,
    int? rating,
    String? successMessage,
    String? errorMessage,
  }) {
    return FeedbackState(
      isLoading: isLoading ?? this.isLoading,
      rating: rating ?? this.rating,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }
}