import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class BottomActions extends StatelessWidget {

  final VoidCallback onHint;
  final VoidCallback onSubmit;

  const BottomActions({
    super.key,
    required this.onHint,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        TextButton(
          onPressed: onHint,
          child: const Text(
            "Hint",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        const Spacer(),

        SizedBox(
          width: 180,
          height: 55,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.background,
              side: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "Submit",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 10),

                Icon(
                  Icons.send,
                  color: AppColors.primary,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}