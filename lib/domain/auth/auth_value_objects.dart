import 'package:dartz/dartz.dart';

import '../core/value_failures/value_failures.dart';
import '../core/value_objects/value_object.dart';
import 'auth_value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const EmailAddress._(this.value);

  factory EmailAddress(String input) => EmailAddress._(
        validateEmailAddress(input),
      );
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String input) => Password._(
        validatePassword(input),
      );
}

class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const UserName._(this.value);

  factory UserName(String input) => UserName._(
        validateUserName(input),
      );
}
