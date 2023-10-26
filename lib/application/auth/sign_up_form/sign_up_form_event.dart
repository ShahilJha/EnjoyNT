part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignUpFormEvent.userNameChanged(String userNameStr) =
      UserNameChanged;
  const factory SignUpFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignUpFormEvent.rePasswordChanged(String rePasswordStr) =
      RePasswordChanged;
  const factory SignUpFormEvent.clearEmailAddress() = ClearEmailAddress;
  const factory SignUpFormEvent.toggleAgreementCheckbox(bool value) =
      ToggleAgreementCheckbox;
  const factory SignUpFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
