import 'package:detective_academy/model/question_model.dart';

class LevelModel {
  final int id;
  final String title;      // LEVEL 1
  final String subtitle;   // Case 1: The Shadow Link
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

  int get totalQuestions => questions.length;

  int get completedQuestions =>
      isCompleted ? questions.length : 0;
}