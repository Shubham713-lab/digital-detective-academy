import '../../model/briefing_model.dart';


class CourseState {
  final bool isLoading;
  final List<CourseModel> courses;
  final String? error;

  const CourseState({
    this.isLoading = false,
    this.courses = const [],
    this.error,
  });

  CourseState copyWith({
    bool? isLoading,
    List<CourseModel>? courses,
    String? error,
  }) {
    return CourseState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
      error: error,
    );
  }
}