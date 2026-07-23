import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/course_repository.dart';

final courseRepositoryProvider =
Provider<CourseRepository>(
      (ref) => CourseRepository(),
);