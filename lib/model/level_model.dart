import 'question_model.dart';

class LevelModel {
  final int id;
  final String title;
  final String subtitle;
  final bool isLocked;
  final bool isCompleted;
  final List<QuestionModel> questions;

  LevelModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isLocked,
    required this.isCompleted,
    required this.questions,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      isLocked: json["isLocked"],
      isCompleted: json["isCompleted"],
      questions: (json["questions"] as List)
          .map((e) => QuestionModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "isLocked": isLocked,
      "isCompleted": isCompleted,
      "questions": questions.map((e) => e.toJson()).toList(),
    };
  }

  int get totalQuestions => questions.length;

  int get completedQuestions =>
      isCompleted ? questions.length : 0;
}