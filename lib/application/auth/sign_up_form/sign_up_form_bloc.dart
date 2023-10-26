import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failures.dart';
import '../../../domain/auth/auth_value_objects.dart';
import '../../../domain/auth/i_auth_facade.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';
part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial()) {
    on<UserNameChanged>(((event, emit) async {
      emit(
        state.copyWith(
          userName: UserName(event.userNameStr),
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

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

    on<RePasswordChanged>(((event, emit) async {
      emit(
        state.copyWith(
          rePassword: Password(event.rePasswordStr),
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

    on<ToggleAgreementCheckbox>(((event, emit) async {
      emit(
        state.copyWith(
          agreementChecked: event.value,
          authFailureOrSuccessOption: none(),
        ),
      );
    }));

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isUserNamevalid = state.userName.isValid();
      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();
      final isRePasswordValid = state.rePassword.isValid();

      if (isUserNamevalid &&
          isEmailValid &&
          isPasswordValid &&
          isRePasswordValid) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );
        failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
          rePassword: state.rePassword,
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
  }
}
