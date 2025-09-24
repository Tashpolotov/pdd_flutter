import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../config/CommonState.dart';
import '../../di/app_component.dart';

/// Базовый класс для всех Cubit в приложении
/// Содержит общую логику для загрузки данных и обработки ошибок
abstract class BaseCubit<T> extends Cubit<CommonState<T>> {
  BaseCubit() : super(const CommonState.initial());

  /// Безопасное выполнение асинхронных операций с автоматической обработкой ошибок
  @protected
  Future<void> safeExecute(Future<T> Function() action) async {
    if (isClosed) return;

    emit(const CommonState.loading());

    try {
      final result = await action();
      if (!isClosed) {
        emit(CommonState.success(result));
      }
    } catch (error, stackTrace) {
      if (!isClosed) {
        logger.e('Error in $runtimeType', error: error, stackTrace: stackTrace);
        emit(CommonState.error(_getErrorMessage(error)));
      }
    }
  }

  /// Преобразование ошибки в читаемое сообщение
  String _getErrorMessage(Object error) {
    // TODO: Добавить более детальную обработку разных типов ошибок
    return "Произошла ошибка: ${error.toString()}";
  }

  /// Обновление данных (refresh)
  void refresh();
}
