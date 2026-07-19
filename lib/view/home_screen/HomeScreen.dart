import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../../view_model/dashboard_viewmodel.dart';
import '../../view_model/navigation_viewmodel.dart';
import 'widgets/recent_activity_card.dart';
import 'widgets/start_case_button.dart';
import 'widgets/stat_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final vm = DashboardViewModel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomAppBar(
        title: "User Dashboard",
        onLogoPressed: () {},
        onMenuPressed: () {},
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 20,
        ),
        child: Column(
          children: [

            StatCard(
              icon: Icons.star,
              title: "XP",
              value: vm.xp.toString(),
            ),

            const SizedBox(height: 35),

            StatCard(
              icon: Icons.shield,
              title: "Badges",
              value: vm.badges.toString(),
            ),

            const SizedBox(height: 35),

            StatCard(
              icon: Icons.dashboard_customize,
              title: "Cases",
              value: vm.cases.toString(),
            ),

            const SizedBox(height: 40),
            Consumer(
              builder: (context, ref, child) {
                return StartCaseButton(
                  onPressed: () {
                    ref.read(bottomNavProvider.notifier).state = 1;

                    debugPrint(
                      "Index = ${ref.read(bottomNavProvider)}",
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 50),

            Row(
              children: [

                const Expanded(
                  child: Text(
                    "Recent Activity",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Text(
                //   "CASE_LOG_V2.84",
                //   style: TextStyle(
                //     color: AppColors.secondary.withOpacity(.7),
                //     fontSize: 11,
                //     letterSpacing: 1,
                //   ),
                // ),
              ],
            ),

            const SizedBox(height: 25),

            ...vm.activities.map(
                  (activity) => Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: RecentActivityCard(
                  activity: activity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}