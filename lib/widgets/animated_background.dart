import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dark gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1E1E2C),
                Color(0xFF2D2D44),
                Color(0xFF1E1E2C),
              ],
            ),
          ),
        ),
        // Floating glowing shapes
        ...List.generate(5, (index) {
          final random = Random(index);
          final size = random.nextDouble() * 200 + 100;
          final left = random.nextDouble() * MediaQuery.of(context).size.width;
          final top = random.nextDouble() * MediaQuery.of(context).size.height * 2; // Span across height

          return Positioned(
            left: left,
            top: top,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.05),
                    blurRadius: 50,
                    spreadRadius: 20,
                  ),
                ],
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .move(
              duration: (random.nextInt(5) + 5).seconds,
              begin: const Offset(0, 0),
              end: Offset(random.nextDouble() * 50, random.nextDouble() * 50),
            )
            .scale(
              duration: (random.nextInt(5) + 5).seconds,
              begin: const Offset(1, 1),
              end: const Offset(1.2, 1.2),
            ),
          );
        }),
      ],
    );
  }
}
