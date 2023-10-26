import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failures.dart';
import '../../../domain/auth/auth_value_objects.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/core/services/i_shared_preference_service.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  final ISharedPreferenceService _sharedPreference;

  SignInFormBloc(this._authFacade, this._sharedPreference)
      : super(SignInFormState.initial()) {
    // on<SignInFormEvent>((event, emit) async {
    //   event.map(
    //       emailChanged: emailChanged,
    //       passwordChanged: passwordChanged,
    //       clearEmailAddress: clearEmailAddress,
    //       toggleRememberMe: toggleRememberMe,
    //       rememberEmail: rememberEmail,
    //       checkRememberedEmail: checkRememberedEmail,
    //       signInWithEmailAndPasswordPressed: signInWithEmailAndPasswordPressed,
    //       signInWithGooglePressed: signInWithGooglePressed);
    // });
    on<EmailChanged>(((event, emit) async {
      emit(
        state.copyWith(
          emailAddress: EmailAddress(event.emailStr),
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

    on<PasswordChanged>(((event, emit) async {
      emit(
        state.copyWith(
          password: Password(event.passwordStr),
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

    on<ClearEmailAddress>(((event, emit) async {
      emit(
        state.copyWith(
          emailAddress: EmailAddress(''),
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

    on<ToggleRememberMe>(((event, emit) async {
      emit(
        state.copyWith(
          rememberMe: event.value,
        ),
      );
    }));

    on<RememberEmail>(((event, emit) async {
      if (state.rememberMe) {
        //set email to shared preference when valid
        state.emailAddress.value.fold(
          (leftFailure) => null,
          (emailString) => _sharedPreference.setRememberEmail(emailString),
        );
      } else {
        //remove set email when value of 'remember me' is false
        _sharedPreference.unsetRememberEmail();
      }
    }));

    on<CheckRememberedEmail>(((event, emit) async {
      final rememberedEmail = await _sharedPreference.getRememberedEmail();
      emit(
        state.copyWith(
          rememberedEmail: rememberedEmail,
          rememberMe: rememberedEmail == '' ? false : true,
          emailAddress: EmailAddress(rememberedEmail),
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }
      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,

          ///optionOf() -> will return none() or some() according to the data null status
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });

    on<SignInWithGooglePressed>(((event, emit) async {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );
      final failureOrSucess = await _authFacade.signInWithGoogle();
      emit(
        state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSucess),
        ),
      );
    }));
  }
}
