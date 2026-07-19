import 'package:flutter/material.dart';

import '../../model/briefing_model.dart';

import '../../res/colors/app_colors.dart';
import '../../res/widgets/app_chip.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../../res/widgets/primary_button.dart';
import '../levels_screen/levels_screen.dart';

class BriefingScreen extends StatelessWidget {
  const BriefingScreen({
    super.key,
    required this.course,
  });

  final CourseModel course;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                course.subtitle.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.primary,
                  letterSpacing: 3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 18),

            Center(
              child: Text(
                course.title,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.primary,
                  size: 25,
                ),
                SizedBox(width: 12),
                Text(
                  "SCENARIO",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              course.scenario,
              style: const TextStyle(
                color: AppColors.text,
                height: 1.8,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Divider(
              color: AppColors.outline.withOpacity(.2),
            ),

            const SizedBox(height: 24),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: course.tags
                  .map((tag) => AppChip(text: tag))
                  .toList(),
            ),

            const SizedBox(height: 40),

            PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LevelsScreen(
                      course: course,
                    ),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}