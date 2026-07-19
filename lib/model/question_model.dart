class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String hint;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.hint,
  });
}