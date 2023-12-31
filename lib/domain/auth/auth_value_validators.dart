import 'package:dartz/dartz.dart';

import '../core/value_failures/value_failures.dart';
import 'auth_value_failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  //TODO: change regex pattern to a more secured one
  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.auth(
        AuthValueFailure.invalidEmail(failedValue: input),
      ),
    );
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left(
      ValueFailure.auth(
        AuthValueFailure.shortPassword(failedValue: input),
      ),
    );
    // return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateUserName(String input) {
  if (input.length > 3 || input.isNotEmpty) {
    return right(input);
  } else {
    return left(
      ValueFailure.auth(
        AuthValueFailure.invalidUserName(failedValue: input),
      ),
    );
    // return left(ValueFailure.shortPassword(failedValue: input));
  }
}
