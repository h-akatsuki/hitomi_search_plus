import 'dart:math';

import 'package:flutter/material.dart';

class ProgressButton2 extends StatelessWidget {
  final double progress;
  final Widget child;
  final VoidCallback onPressed;

  const ProgressButton2({
    super.key,
    required this.progress,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProgressPainter(progress: progress),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}