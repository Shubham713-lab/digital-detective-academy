import 'dart:math';

import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';

class AnimatedParticles extends StatefulWidget {
  const AnimatedParticles({super.key});

  @override
  State<AnimatedParticles> createState() =>
      _AnimatedParticlesState();
}

class _AnimatedParticlesState
    extends State<AnimatedParticles> {

  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        45,
            (index) {
          return Positioned(
            left: random.nextDouble() *
                MediaQuery.of(context).size.width,
            top: random.nextDouble() *
                MediaQuery.of(context).size.height,
            child: Container(
              width: random.nextDouble() * 3 + 1,
              height: random.nextDouble() * 3 + 1,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}