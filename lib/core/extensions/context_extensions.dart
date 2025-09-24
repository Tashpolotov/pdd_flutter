import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Extension методы для упрощения работы с BuildContext
extension ContextExtensions on BuildContext {
  // Навигация
  void pushNamed(String route) => push(route);
  void pushWithExtra(String route, Object? extra) => push(route, extra: extra);
  void popScreen() => pop();
  void goToRoute(String route) => go(route);
  void goToRouteWithExtra(String route, Object? extra) => go(route, extra: extra);

  // Размеры экрана
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isSmallScreen => screenWidth < 600;

  // Цвета и темы
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Snackbar shortcuts
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
  }

  /// Показать SnackBar с кастомными настройками
  void showCustomSnackBar({
    required String message,
    Color? backgroundColor,
    Duration? duration,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 4),
        action: action,
      ),
    );
  }
}
