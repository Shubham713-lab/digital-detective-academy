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

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      scenario: json["scenario"],
      tags: List<String>.from(json["tags"]),
      levels: (json["levels"] as List)
          .map((e) => LevelModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "scenario": scenario,
      "tags": tags,
      "levels": levels.map((e) => e.toJson()).toList(),
    };
  }
}