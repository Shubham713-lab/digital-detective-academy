import 'package:detective_academy/view/question_screen/widget/bottom_actions.dart';
import 'package:detective_academy/view/question_screen/widget/option_card.dart';
import 'package:detective_academy/view/question_screen/widget/question_card.dart';
import 'package:flutter/material.dart';

import '../../model/level_model.dart';
import '../../model/question_model.dart';
import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final LevelModel level;

  const QuestionScreen({
    super.key,
    required this.level,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currentIndex = 0;
  int? selectedIndex;
  int score = 0;

  QuestionModel get question =>
      widget.level.questions[currentIndex];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar:  AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// LEVEL

              Text(
                widget.level.title,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                widget.level.subtitle,
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24),

              /// Progress

              LinearProgressIndicator(
                value: (currentIndex + 1) /
                    widget.level.questions.length,
                minHeight: 4,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: AppColors.surface,
                color: AppColors.primary,
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${currentIndex + 1}/${widget.level.questions.length}",
                  style: const TextStyle(
                    color: AppColors.secondary,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              /// Question Card

              QuestionCard(
                question: question.question,
              ),

              const SizedBox(height: 20),

              /// Options

              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {

                    return OptionCard(

                      text: question.options[index],

                      isSelected:
                      selectedIndex == index,

                      onTap: () {

                        setState(() {

                          selectedIndex = index;

                        });

                      },
                    );

                  },
                ),
              ),

              BottomActions(

                onHint: () {

                  showDialog(

                    context: context,

                    builder: (_) => AlertDialog(

                      backgroundColor: AppColors.surface,

                      title: const Text(
                        "Hint",
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),

                      content: Text(
                        question.hint,
                        style: const TextStyle(
                          color: AppColors.text,
                        ),
                      ),

                      actions: [

                        TextButton(

                          onPressed: () {

                            Navigator.pop(context);

                          },

                          child: const Text(
                            "Close",
                          ),

                        ),

                      ],
                    ),
                  );

                },

                onSubmit: () {
                  if (selectedIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select an answer."),
                      ),
                    );
                    return;
                  }

                  // Check answer
                  if (selectedIndex == question.correctAnswerIndex) {
                    score++;
                  }

                  // Last Question
                  if (currentIndex == widget.level.questions.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultScreen(
                          score: score,
                          totalQuestions: widget.level.questions.length,
                          level: widget.level,
                        ),
                      ),
                    );
                    return;
                  }

                  // Next Question
                  setState(() {
                    currentIndex++;
                    selectedIndex = null;
                  });
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}