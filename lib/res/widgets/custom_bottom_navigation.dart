import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../colors/app_colors.dart';
import '../../view_model/navigation_viewmodel.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final index = ref.watch(bottomNavProvider);

    return Container(
      // margin: const EdgeInsets.all(16),
      height: 82,
      decoration: BoxDecoration(
        color: AppColors.surface,
        // borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [

          _item(
            context,
            ref,
            0,
            Icons.dashboard_outlined,
            "Dashboard",
            index,
          ),

          _item(
            context,
            ref,
            1,
            Icons.search,
            "Investigations",
            index,
          ),

          _item(
            context,
            ref,
            2,
            Icons.person_outline,
            "Profile",
            index,
          ),
        ],
      ),
    );
  }

  Widget _item(
      BuildContext context,
      WidgetRef ref,
      int value,
      IconData icon,
      String title,
      int selected,
      ) {

    final isSelected = value == selected;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          ref.read(bottomNavProvider.notifier).state = value;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(.18)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color:
                AppColors.primary.withOpacity(.25),
                blurRadius: 100,
              )
            ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                icon,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.text,
                size: 26,
              ),

              const SizedBox(height: 8),

              Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}