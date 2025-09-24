import 'package:flutter/material.dart';
import '../../config/CommonState.dart';

/// Extension методы для упрощения работы с CommonState
extension CommonStateExtensions<T> on CommonState<T> {
  // Проверки состояния
  bool get isLoading => this is Loading;
  bool get isSuccess => this is Success;
  bool get isError => this is Error;
  bool get isInitial => this is Initial;

  // Получение данных
  T? get dataOrNull => isSuccess ? (this as Success<T>).data : null;
  String? get errorMessage => isError ? (this as Error).message : null;

  /// Удобный метод для построения UI в зависимости от состояния
  Widget when({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function(T data)? success,
    Widget Function(String message)? error,
  }) {
    return switch (this) {
      Initial() => initial?.call() ?? const SizedBox.shrink(),
      Loading() => loading?.call() ?? const Center(child: CircularProgressIndicator()),
      Success(:final data) => success?.call(data) ?? const SizedBox.shrink(),
      Error(:final message) => error?.call(message) ?? Center(child: Text('Ошибка: $message')),
      _ => const SizedBox.shrink(),
    };
  }
}
