import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/auth/auth_bloc.dart';
import '../../../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../../../injection.dart';
import '../../../../utils/utilities.dart';
import 'sign_in_form.dart';

class SignInPageScaffold extends StatelessWidget {
  const SignInPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInFormBloc, SignInFormState>(
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
                cancelledByUser: (_) => some('Cancelled'),
                serverError: (_) => some('Server Error'),
                emailALreadyInUse: (_) => some('Email Already in Use'),
                invalidEmailAndPasswordCombination: (_) =>
                    some('Invalid Email and Password Combination'),
                orElse: () => none(),
              );

              snackBarText.fold(
                () => null,
                (text) => getIt<Utilities>().showSnackBar(text: text),
              );
            },
            //in Unit
            (_) {
              //check 'Remember me'
              context
                  .read<SignInFormBloc>()
                  .add(const SignInFormEvent.rememberEmail());
              //TODO: navigation
              //Navigation
              // context.router.replaceNamed();
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
          automaticallyImplyLeading: false,
        ),
        body: const SignInForm(),
      ),
    );
  }
}
