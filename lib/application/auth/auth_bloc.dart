import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthCheckRequested>(
      (event, emit) async {
        final Option<User> userOption = await _authFacade.getSignedInUser();
        userOption.fold(
          //none()
          () => emit(const AuthState.unauthenticated()),
          //some()
          (some) => emit(
            AuthState.authenticated(
              User(
                id: some.id,
                username: some.username,
                emailAddress: some.emailAddress,
              ),
            ),
          ),
        );
      },
    );

    on<SignOut>(
      (event, emit) async {
        await _authFacade.signOutUser();
        emit(const AuthState.unauthenticated());
      },
    );

    on<DeactivateAccount>(
      (event, emit) async {
        await _authFacade.signOutUser();
        emit(const AuthState.unauthenticated());
      },
    );
  }
}
