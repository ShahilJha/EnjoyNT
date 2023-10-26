import 'package:enjoy_nt/domain/auth/auth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/unique_id.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UniqueId id,
    required UserName username,
    required EmailAddress emailAddress,
  }) = _User;
}
