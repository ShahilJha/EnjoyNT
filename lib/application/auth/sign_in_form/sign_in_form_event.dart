part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInFormEvent.clearEmailAddress() = ClearEmailAddress;
  const factory SignInFormEvent.toggleRememberMe(bool value) = ToggleRememberMe;
  const factory SignInFormEvent.rememberEmail() = RememberEmail;
  const factory SignInFormEvent.checkRememberedEmail() = CheckRememberedEmail;
  const factory SignInFormEvent.changeFirstStart() = ChangeFirstStart;
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
