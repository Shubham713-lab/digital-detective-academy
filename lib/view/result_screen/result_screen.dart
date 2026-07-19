import 'package:detective_academy/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';

import '../../model/level_model.dart';
import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../../res/widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final LevelModel level;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions) * 100;

    String message;

    if (percentage == 100) {
      message = "Outstanding Detective!";
    } else if (percentage >= 70) {
      message = "Great Investigation!";
    } else if (percentage >= 50) {
      message = "Good Attempt!";
    } else {
      message = "Mission Failed";
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: "Mission Result",
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.verified_user,
              size: 100,
              color: AppColors.primary,
            ),

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            // const SizedBox(height: 8),

            Text(
              level.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
              ),
            ),

            // const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [

                  Text(
                    "$score / $totalQuestions",
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${percentage.toStringAsFixed(0)}%",
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // PrimaryButton(
            //   onPressed: () {
            //     Navigator.popUntil(
            //       context,
            //           (route) => route.isFirst,
            //     );
            //   },
            // ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => NavigationScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
          borderRadius: BorderRadius.circular(40),
          child: Container(
            height: 70,
            // width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Go Home!",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 18),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 34,
                )
              ],
            ),
          ),
        )
          ],
        ),
      ),
    );
  }
}