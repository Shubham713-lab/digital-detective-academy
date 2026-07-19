import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final String question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [

          Positioned(
            right: -20,
            top: -10,
            child: Icon(
              Icons.fingerprint,
              size: 130,
              color: Colors.white.withOpacity(.05),
            ),
          ),

          Text(
            question,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 22,
              height: 1.6,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}