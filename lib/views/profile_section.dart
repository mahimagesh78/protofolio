import 'package:flutter/material.dart';
import '../constants.dart';

/// A refined profile picture with a slow, subtle rotating dashed-gradient
/// ring — professional rather than flashy. The photo stays upright.
class AnimatedProfile extends StatefulWidget {
  final String imagePath;
  final double size;

  const AnimatedProfile({super.key, required this.imagePath, this.size = 280});

  @override
  State<AnimatedProfile> createState() => _AnimatedProfileState();
}

class _AnimatedProfileState extends State<AnimatedProfile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double ringSize = widget.size + 28;

    return SizedBox(
      width: ringSize + 16,
      height: ringSize + 16,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Slow rotating dashed ring
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 6.28319,
                child: child,
              );
            },
            child: CustomPaint(
              size: Size(ringSize, ringSize),
              painter: _DashedRingPainter(color: Theme.of(context).colorScheme.primary),
            ),
          ),

          // White gap
          Container(
            width: widget.size + 14,
            height: widget.size + 14,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),

          // Static photo
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedRingPainter extends CustomPainter {
  final Color color;
  _DashedRingPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    const dashCount = 40;
    const gapFraction = 0.4; // fraction of each segment that's a gap

    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i / dashCount) * 6.28319;
      final sweep = (1 / dashCount) * 6.28319 * (1 - gapFraction);
      // Fade opacity around the ring for a subtle "comet" effect
      final progress = i / dashCount;
      paint.color = color.withOpacity(0.15 + 0.55 * progress);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweep,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
