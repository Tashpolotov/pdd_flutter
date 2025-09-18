import 'package:flutter/material.dart';

class LessonPathConnector extends StatelessWidget {
  final bool isCompleted;
  final double height;

  const LessonPathConnector({
    super.key,
    required this.isCompleted,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      height: height,
      child: CustomPaint(
        painter: _LinePainter(
          color: isCompleted ? const Color(0xFF1FB0C8) : Colors.grey.shade300,
          dashed: false,
        ),
      ),
    );
  }
}

class LessonPathDottedConnector extends StatelessWidget {
  final bool isCompleted;
  final double height;

  const LessonPathDottedConnector({
    super.key,
    required this.isCompleted,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      height: height,
      child: CustomPaint(
        painter: _LinePainter(
          color: isCompleted ? const Color(0xFF1FB0C8) : Colors.grey.shade300,
          dashed: true,
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  final Color color;
  final bool dashed;

  _LinePainter({required this.color, required this.dashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round;

    final x = size.width / 2;

    if (!dashed) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      return;
    }

    const dash = 6.0;
    const gap = 6.0;
    double y = 0;
    while (y < size.height) {
      final double y2 = (y + dash).clamp(0.0, size.height).toDouble();
      canvas.drawLine(Offset(x, y), Offset(x, y2), paint);
      y = y2 + gap;
    }
  }

  @override
  bool shouldRepaint(_LinePainter old) =>
      old.color != color || old.dashed != dashed;
}
