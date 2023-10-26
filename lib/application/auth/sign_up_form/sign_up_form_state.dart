part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required UserName userName,
    required EmailAddress emailAddress,
    required Password password,
    required Password rePassword,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool agreementChecked,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
        userName: UserName(''),
        emailAddress: EmailAddress(''),
        password: Password(''),
        rePassword: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        agreementChecked: false,
      );
}
