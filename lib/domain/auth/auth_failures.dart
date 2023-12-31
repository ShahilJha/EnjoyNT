import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailALreadyInUse() = EmailALreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory AuthFailure.passwordsNotSame() = PasswordsNotSame;
}
