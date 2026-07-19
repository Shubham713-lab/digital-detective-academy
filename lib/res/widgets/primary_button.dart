import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 60,
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
              "Let's Begin!",
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
    );
  }
}