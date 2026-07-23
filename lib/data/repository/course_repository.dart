import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/briefing_model.dart';

class CourseRepository {
  Future<List<CourseModel>> getCourses() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/courses.json',
      );

      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData
          .map(
            (course) => CourseModel.fromJson(course),
      )
          .toList();
    } catch (e) {
      throw Exception(
        'Failed to load courses: $e',
      );
    }
  }

  Future<CourseModel?> getCourseById(int id) async {
    final courses = await getCourses();

    try {
      return courses.firstWhere(
            (course) => course.id == id,
      );
    } catch (_) {
      return null;
    }
  }
}