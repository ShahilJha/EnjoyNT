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

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      print('****** RegisterWithEmailAndPasswordPressed #1');
      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();
      print('****** RegisterWithEmailAndPasswordPressed #2');

      if (isEmailValid && isPasswordValid) {
        print('****** RegisterWithEmailAndPasswordPressed #3');
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );
        print('****** RegisterWithEmailAndPasswordPressed #4');
        failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
          rePassword: state.rePassword,
        );
      }
      print('****** RegisterWithEmailAndPasswordPressed #5');
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
