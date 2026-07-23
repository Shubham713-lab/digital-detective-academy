import 'dart:async';

import 'package:detective_academy/navigation/navigation_screen.dart';
import 'package:detective_academy/view/login_screen/login_screen.dart';
import 'package:detective_academy/view/splash_screen/widgets/particle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../res/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> logoAnimation;
  late Animation<double> textAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1800,
      ),
    );

    logoAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );

    textAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          .4,
          1,
        ),
      ),
    );

    controller.forward();

    Timer(
      const Duration(
        seconds: 3,
      ),
      _checkUserLogin,
    );
  }

  void _checkUserLogin() {
    if (!mounted) return;

    // Get currently logged-in Firebase user
    final User? user =
        FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
          NavigationScreen(),
        ),
      );
    } else {
      // User is not logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
          const LoginScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      AppColors.background,

      body: Stack(
        children: [

          const AnimatedParticles(),

          Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                const Icon(
                  Icons.verified,
                  color: Colors.white54,
                  size: 15,
                ),

                const SizedBox(
                  height: 6,
                ),

                const Text(
                  "SECURITY VERIFIED",
                  style: TextStyle(
                    color: Colors.white54,
                    letterSpacing: 2,
                    fontWeight:
                    FontWeight.w600,
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),

                ScaleTransition(
                  scale: logoAnimation,

                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 230,
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),

                FadeTransition(
                  opacity: textAnimation,

                  child: Column(
                    children: const [

                      Text(
                        "DETECTIVE ACADEMY",
                        style: TextStyle(
                          color:
                          AppColors.primary,
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),

                      SizedBox(
                        height: 14,
                      ),

                      Text(
                        "CYBER SLEUTH DIVISION",
                        style: TextStyle(
                          color:
                          Colors.white70,
                          letterSpacing: 6,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}