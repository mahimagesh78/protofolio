import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';

/// Subtle, professional background — a soft radial glow near the top
/// and a very faint dot grid. No distracting motion.
class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Theme.of(context).scaffoldBackgroundColor),

        // Soft radial glow, top center
        Positioned(
              top: -150,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 700,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.07),
                        Theme.of(context).colorScheme.primary.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .fadeIn(duration: 3000.ms, begin: 0.6),

        // Faint dot grid pattern
        Positioned.fill(child: CustomPaint(painter: _DotGridPainter(color: Theme.of(context).colorScheme.outline))),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color color;
  _DotGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withOpacity(0.5);
    const spacing = 28.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
