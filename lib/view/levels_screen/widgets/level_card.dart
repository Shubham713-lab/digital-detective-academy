import 'package:flutter/material.dart';
import '../../../model/level_model.dart';
import '../../../res/colors/app_colors.dart';

class LevelCard extends StatelessWidget {
  final LevelModel level;
  final VoidCallback? onTap;

  const LevelCard({
    super.key,
    required this.level,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool active =
        !level.isLocked && !level.isCompleted;

    return InkWell(
      onTap: level.isLocked ? null : onTap,
      borderRadius: BorderRadius.circular(35),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: active
              ? AppColors.primary.withOpacity(.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            Text(
              level.id.toString().padLeft(2, "0"),
              style: TextStyle(
                color: level.isLocked
                    ? AppColors.outline
                    : AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    level.title,
                    style: TextStyle(
                      color: level.isLocked
                          ? AppColors.outline
                          : level.isCompleted
                          ? AppColors.text
                          : AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    level.subtitle,
                    style: TextStyle(
                      color:
                      AppColors.text.withOpacity(.5),
                      fontStyle: FontStyle.italic,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
            ),

            if (!level.isLocked)
              Text(
                "${level.completedQuestions}/${level.totalQuestions}",
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

            const SizedBox(width: 14),

            Icon(
              level.isLocked
                  ? Icons.lock_outline
                  : level.isCompleted
                  ? Icons.check_circle
                  : Icons.play_circle_outline,
              color: AppColors.primary,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}