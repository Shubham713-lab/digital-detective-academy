import 'package:flutter/material.dart';

import '../../model/agent_model.dart';
import '../../res/colors/app_colors.dart';
import '../../res/widgets/custom_app_bar.dart';
import 'widgets/agent_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final List<AgentModel> agents = [
    AgentModel(
      initials: "AS",
      name: "Agent Smith",
      status: "Level 1: The Digital Trail",
      isOnline: true,
    ),
    AgentModel(
      initials: "AM",
      name: "Agent Miller",
      status: "Level 3: The Midnight Heist",
      isOnline: true,
    ),
    AgentModel(
      initials: "JD",
      name: "Agent Doe",
      status: "Last Active: 2h ago",
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final activeSessions =
        agents.where((e) => e.isOnline).length;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: const CustomAppBar(
        title: "ADMIN DASHBOARD",
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Container(
                  width: 5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    "LIVE INVESTIGATOR\nTRACKING",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [

                    const Text(
                      "ACTIVE",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),

                    Text(
                      "SESSIONS: ${activeSessions.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.separated(
                itemCount: agents.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 22),
                itemBuilder: (context, index) {
                  return AgentCard(
                    agent: agents[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}