import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_value_failures.freezed.dart';

@freezed
class CoreValueFailure<T> with _$CoreValueFailure<T> {
  const factory CoreValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory CoreValueFailure.invalidLength({
    required T failureValue,
    required int max,
    required int min,
  }) = InvalidLength;

  const factory CoreValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory CoreValueFailure.multiLine({
    required T failedValue,
  }) = MultiLine<T>;
}
