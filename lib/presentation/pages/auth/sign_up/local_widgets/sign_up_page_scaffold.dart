import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/auth/auth_bloc.dart';
import '../../../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../../../../injection.dart';
import '../../../../utils/utilities.dart';
import 'sign_up_form.dart';

class SignUpPageScaffold extends StatelessWidget {
  const SignUpPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpFormBloc, SignUpFormState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (context, state) {
        //show error in snackbar when required
        state.authFailureOrSuccessOption.fold(
          //none()
          () => null,
          //some()
          (either) => either.fold(
            //in Failure
            (leftFailure) {
              Option<String> snackBarText = leftFailure.maybeMap(
                serverError: (_) => some('Server Error'),
                emailALreadyInUse: (_) => some('Email Already in Use'),
                passwordsNotSame: (_) => some('Passwords Mismatch'),
                orElse: () => none(),
              );

              snackBarText.fold(
                () => null,
                (text) => getIt<Utilities>().showSnackBar(text: text),
              );
            },
            //in Unit
            (_) {
              //Navigation -> pop page to login when registered
              getIt<Utilities>().removeHistoryAndPop(context);
              //making the auth state in the AuthBloc as _authenticated_
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Sign In'),
          centerTitle: true,
          automaticallyImplyLeading: kIsWeb ? false : true,
        ),
        body: const SignUpForm(),
      ),
    );
  }
}
