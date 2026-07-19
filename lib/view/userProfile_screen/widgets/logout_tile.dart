import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Colors.red.withOpacity(.25),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.red.withOpacity(.18),
              child: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),

            const SizedBox(width: 20),

            const Expanded(
              child: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const Icon(
              Icons.power_settings_new,
              color: Colors.redAccent,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}