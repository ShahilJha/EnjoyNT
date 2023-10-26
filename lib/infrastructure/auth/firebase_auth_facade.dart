import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/auth_failures.dart';
import '../../domain/auth/auth_value_objects.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/entities/user.dart' as app_user;

import './firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Option<app_user.User>> getSignedInUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    return optionOf(firebaseUser?.toDomain());
  }

  // @override
  // Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
  //   required EmailAddress emailAddress,
  //   required Password password,
  //   required Password rePassword,
  // }) {
  //   // TODO: implement registerWithEmailAndPassword
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required UserName userName,
    required EmailAddress emailAddress,
    required Password password,
    required Password rePassword,
  }) async {
    final emailAdressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    final rePasswordStr = rePassword.getOrCrash();
    final userNameStr = userName.getOrCrash();

    if (passwordStr != rePasswordStr) {
      return left(const AuthFailure.passwordsNotSame());
    }
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAdressStr,
        password: passwordStr,
      );
      User user = result.user!;
      user.updateDisplayName(userNameStr);
      // user.updateEmail(emailAdressStr);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      print('EXCEPTION=> ${e.message}');
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailALreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAdressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    print('CALLED METHOD=> $emailAdressStr - $passwordStr');

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAdressStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      print('EXCEPTION=> ${e.message}');
      if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      print("**********Start method => signInWithGoogle()");
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      print("**********WIP method => #Check #1");
      final googleAuthentication = await googleUser.authentication;
      print("**********WIP method => #Check #2");
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      print("**********WIP method => #Check #3");
      await _firebaseAuth.signInWithCredential(authCredential);
      print('**********Google signed in');
      return right(unit);
    } on FirebaseAuthException catch (_) {
      print('**********Firebase google signin error');
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOutUser() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}
