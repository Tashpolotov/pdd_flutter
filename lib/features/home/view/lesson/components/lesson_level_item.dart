import 'package:flutter/material.dart';

enum LessonStatus {
  locked,
  current,
  completed,
  finalLesson,
}

class LessonLevelItem extends StatelessWidget {
  final int levelNumber;
  final LessonStatus status;
  final bool isOnLeftSide;
  final VoidCallback? onTap;

  const LessonLevelItem({
    super.key,
    required this.levelNumber,
    required this.status,
    required this.isOnLeftSide,
    this.onTap,
  });

  static const _circle = 60.0;
  static const _final = 68.0;

  @override
  Widget build(BuildContext context) {
    final isFinal = status == LessonStatus.finalLesson;

      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: isFinal ? _final : _circle,
          height: isFinal ? _final : _circle,
          child: Container(
            width: isFinal ? _final : _circle,
            height: isFinal ? _final : _circle,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isFinal ? const Color(0xFFFF9500) : _getCircleColor(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: isFinal
                  ? const Icon(Icons.star, size: 30, color: Colors.white)
                  : Text(
                levelNumber.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
  }

  Color _getCircleColor() {
    switch (status) {
      case LessonStatus.locked:
        return Colors.grey.shade400;
      case LessonStatus.current:
        return const Color(0xFF1FB0C8); // бирюзовый как на макете
      case LessonStatus.completed:
        return const Color(0xFF1FB0C8);
      case LessonStatus.finalLesson:
        return const Color(0xFFFF9500);
    }
  }
}
