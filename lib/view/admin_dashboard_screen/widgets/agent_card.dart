import 'package:flutter/material.dart';

import '../../../model/agent_model.dart';
import '../../../res/colors/app_colors.dart';

class AgentCard extends StatelessWidget {
  final AgentModel agent;

  const AgentCard({
    super.key,
    required this.agent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Avatar
        Stack(
          clipBehavior: Clip.none,
          children: [

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: agent.isOnline
                    ? AppColors.primary.withOpacity(.15)
                    : AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: agent.isOnline
                      ? AppColors.primary
                      : AppColors.outline,
                  width: 1.4,
                ),
                boxShadow: agent.isOnline
                    ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(.18),
                    blurRadius: 12,
                    spreadRadius: 1,
                  )
                ]
                    : [],
              ),
              child: Center(
                child: Text(
                  agent.initials,
                  style: TextStyle(
                    color: agent.isOnline
                        ? AppColors.primary
                        : AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            Positioned(
              right: -1,
              bottom: -1,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: agent.isOnline
                      ? AppColors.primary
                      : Colors.grey,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.background,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 14),

        /// Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                agent.name,
                style: TextStyle(
                  color: agent.isOnline
                      ? AppColors.text
                      : AppColors.secondary.withOpacity(.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                agent.status,
                style: TextStyle(
                  color: agent.isOnline
                      ? AppColors.primary
                      : AppColors.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}