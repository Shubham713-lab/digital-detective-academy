import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppChip extends StatelessWidget {
  final String text;

  const AppChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(.35),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.outline.withOpacity(.5),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.secondary,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}