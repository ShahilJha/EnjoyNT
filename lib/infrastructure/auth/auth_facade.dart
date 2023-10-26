import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failures.dart';
import '../../domain/auth/auth_value_objects.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/entities/user.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  @override
  Future<Option<User>> getSignedInUser() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        // return some(User(id: UniqueId()));
        return none();
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required Password rePassword,
  }) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (password.value != rePassword.value) {
          print(
              'Password -> ${password.value} \n RePassword -> ${rePassword.value} \n Result ${password.value != rePassword.value}');
          return left(const AuthFailure.passwordsNotSame());
        } else {
          return right(unit);
        }
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        // return left(const AuthFailure.emailALreadyInUse());
        return right(unit);
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return right(unit);
      },
    );
  }

  @override
  Future<void> signOutUser() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
  }
}
