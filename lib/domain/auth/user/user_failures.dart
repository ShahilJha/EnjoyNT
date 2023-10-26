import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_failures.freezed.dart';

@freezed
class UserFailure with _$UserFailure {
  const factory UserFailure.unexpected() = _Unexpected;
  const factory UserFailure.insufficientPermission() = _InsufficientPermission;
  const factory UserFailure.unableToDelete() = _UnableToDelete;
  const factory UserFailure.unableToUpdate() = _UnableToUpdate;
}
