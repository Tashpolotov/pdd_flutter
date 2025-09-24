import 'package:flutter/material.dart';
import '../constants/lesson_constants.dart';

/// Виджеты для отображения различных состояний экрана уроков
class LessonStateWidgets {
  /// Виджет загрузки
  static Widget loading() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Виджет ошибки
  static Widget error(String message) {
    return Center(
      child: Text(
        'Ошибка: $message',
        style: const TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Виджет "нет данных"
  static Widget noData() {
    return const Center(
      child: Text('Нет данных'),
    );
  }

  /// Виджет загрузки теста
  static Widget testLoading() {
    return const SizedBox(
      height: LessonConstants.rowHeight,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  /// Виджет ошибки загрузки теста
  static Widget testError(String message) {
    return SizedBox(
      height: LessonConstants.rowHeight,
      child: Center(
        child: Text(
          'Ошибка загрузки теста: $message',
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Пустой виджет
  static Widget empty() {
    return const SizedBox.shrink();
  }

  /// Приватный конструктор для предотвращения создания экземпляров
  LessonStateWidgets._();
}
