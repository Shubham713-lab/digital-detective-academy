import 'level_model.dart';

class CourseModel {
  final int id;
  final String title;
  final String subtitle;
  final String scenario;
  final List<String> tags;
  final List<LevelModel> levels;

  CourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.scenario,
    required this.tags,
    required this.levels,
  });
}