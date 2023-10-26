import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/auth_value_failures.dart';
import 'core_value_failures.dart';

part 'value_failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.core(CoreValueFailure<T> coreFailure) = _Core<T>;
  const factory ValueFailure.auth(AuthValueFailure<T> authFailure) = _Auth<T>;
}
