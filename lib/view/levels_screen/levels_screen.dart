import 'package:flutter/material.dart';

import '../../model/briefing_model.dart';
import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../question_screen/question_screen.dart';
import 'widgets/level_card.dart';

class LevelsScreen extends StatelessWidget {
  final CourseModel course;

  const LevelsScreen({
    super.key,
    required this.course,
  });

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
      body: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18,),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 120,
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.search,
                  color: AppColors.primary,
                  size: 40,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              course.subtitle,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                const Text(
                  "Levels",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.outline,
                    ),
                  ),
                  child: Text(
                    "${course.levels.length} LEVELS",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: course.levels.length,
                itemBuilder: (context, index) {
                  final level = course.levels[index];

                  return LevelCard(
                    level: level,
                    onTap: level.isLocked
                        ? null
                        : () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => QuestionScreen(
                            level: level,
                          ),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                     },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}