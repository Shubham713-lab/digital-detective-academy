import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/course_repository.dart';
import 'course_provider.dart';
import 'course_state.dart';

final courseProvider =
StateNotifierProvider<CourseViewModel, CourseState>(
      (ref) => CourseViewModel(
    ref.read(courseRepositoryProvider),
  ),
);

class CourseViewModel
    extends StateNotifier<CourseState> {
  final CourseRepository repository;

  CourseViewModel(this.repository)
      : super(const CourseState()) {
    loadCourses();
  }

  Future<void> loadCourses() async {
    state = state.copyWith(isLoading: true);

    try {
      final courses =
      await repository.getCourses();

      state = state.copyWith(
        isLoading: false,
        courses: courses,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}