import 'package:flutter/material.dart';

import '../../model/profile_model.dart';
import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import '../../view_model/profile_viewmodel.dart';
import '../feedback_screen/feedback_screen.dart';
import '../login_screen/login_screen.dart';
import 'widgets/logout_tile.dart';
import 'widgets/setting_tile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final vm = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomAppBar(
        title: "Profile Setting",
        onLogoPressed: () {},
        onMenuPressed: () {},
      ),

      body: FutureBuilder<ProfileModel>(
        future: vm.loadProfile(),

        builder: (context, snapshot) {

          // Loading
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 16,
                ),
              ),
            );
          }

          // No data
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "Profile not found.",
                style: TextStyle(
                  color: AppColors.text,
                ),
              ),
            );
          }

          // Firebase Profile
          final profile = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(22),

            child: Column(
              children: [

                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: AppColors.background,
                  ),
                ),

                const SizedBox(height: 8),

                // Name from Firebase
                Text(
                  profile.name,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // Email from Firebase
                Text(
                  profile.email,
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  profile.designation,
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius:
                          BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.outline
                                .withOpacity(.25),
                          ),
                        ),
                        child: Column(
                          children: [

                            Text(
                              "${profile.solvedCases}",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              "Cases Solved",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius:
                          BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.outline
                                .withOpacity(.25),
                          ),
                        ),
                        child: Column(
                          children: [

                            Text(
                              "${profile.accuracy}%",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              "Accuracy",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                    BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.outline
                          .withOpacity(.25),
                    ),
                  ),
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                        AppColors.primary
                            .withOpacity(.2),
                        child: const Icon(
                          Icons.workspace_premium,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              profile.rank,
                              style: const TextStyle(
                                color:
                                AppColors.primary,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),

                            const Text(
                              "Current Rank",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Operational Settings",
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SettingTile(
                  icon: Icons.person_outline,
                  title: "Account Settings",
                  onTap: () {},
                ),

                SettingTile(
                  icon: Icons.shield_outlined,
                  title: "Privacy & Security",
                  onTap: () {},
                ),

                SettingTile(
                  icon: Icons.feedback_outlined,
                  title: "Feedback",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                        const FeedbackScreen(),
                        transitionDuration:
                        Duration.zero,
                        reverseTransitionDuration:
                        Duration.zero,
                      ),
                    );
                  },
                ),

                LogoutTile(
                  onTap: () async {
                    try {
                      await vm.logout();

                      if (!context.mounted) return;

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                            (route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Logout failed: $e",
                          ),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}