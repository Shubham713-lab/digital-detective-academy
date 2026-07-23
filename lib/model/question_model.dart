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

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json["question"],
      options: List<String>.from(json["options"]),
      correctAnswerIndex: json["correctAnswerIndex"],
      hint: json["hint"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "question": question,
      "options": options,
      "correctAnswerIndex": correctAnswerIndex,
      "hint": hint,
    };
  }
}