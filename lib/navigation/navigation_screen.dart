import 'package:detective_academy/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/widgets/custom_bottom_navigation.dart';
import '../../view_model/navigation_viewmodel.dart';
import '../view/course_screen/course_screen.dart';
import '../view/home_screen/HomeScreen.dart';
import '../view/userProfile_screen/profile_screen.dart';

class NavigationScreen extends ConsumerWidget {
  NavigationScreen({super.key});

  final pages = [
    HomeScreen(),
    CoursesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}