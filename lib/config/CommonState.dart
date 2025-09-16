import 'package:freezed_annotation/freezed_annotation.dart';
part 'CommonState.freezed.dart';

@freezed
class CommonState<T> with _$CommonState<T> {
  const factory CommonState.initial() = Initial<T>;
  const factory CommonState.loading() = Loading<T>;
  const factory CommonState.success(T data) = Success<T>;
  const factory CommonState.error(String message) = Error<T>;
}
