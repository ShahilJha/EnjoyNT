import 'package:dartz/dartz.dart';

import '../core/entities/user.dart';
import 'auth_failures.dart';
import 'auth_value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required UserName userName,
    required EmailAddress emailAddress,
    required Password password,
    required Password rePassword,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOutUser();

  Future<void> deactivateUser();

  Future<void> updateUserName({required String name});

  Future<void> updateUserPassword({required String password});
}
