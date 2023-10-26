import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../../routes/router.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_text_field.dart';
import '../../../../widgets/enjoy_nt_logo.dart';
import '../../../../widgets/google_button.dart';
import '../../../../widgets/or_divider.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignInFormBloc>();
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Hi, Welcome Back, you have been missed.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      AppTextField(
                        initialValue: state.rememberedEmail,
                        textFieldType: TextFieldType.email,
                        // autoFocus: true,
                        onSuffixIconPressed: () => bloc.add(
                          const SignInFormEvent.clearEmailAddress(),
                        ),
                        onChanged: (value) =>
                            bloc.add(SignInFormEvent.emailChanged(value)),
                        validator: (_) => bloc.state.emailAddress.value.fold(
                          //left Failure
                          (leftFailure) => leftFailure.maybeMap(
                            auth: (failure) => failure.authFailure.maybeMap(
                              invalidEmail: (_) => 'Invlid Email',
                              orElse: () => null,
                            ),
                            orElse: () => null,
                          ),
                          //right value
                          (_) => null,
                        ),
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.password,
                        onChanged: (value) =>
                            bloc.add(SignInFormEvent.passwordChanged(value)),
                        validator: (_) => bloc.state.password.value.fold(
                          (leftFailure) => leftFailure.maybeMap(
                            auth: (failure) => failure.authFailure.maybeMap(
                              shortPassword: (_) => 'Invalid Password',
                              orElse: () => null,
                            ),
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                      ),
                      // const SizedBox(height: 8),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Checkbox(
                      //       value: bloc.state.rememberMe,
                      //       onChanged: (value) => bloc
                      //           .add(SignInFormEvent.toggleRememberMe(value!)),
                      //     ),
                      //     const Text("Remember Me?"),
                      //   ],
                      // ),
                      // const SizedBox(height: 8),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Padding(
                      //       padding:
                      //           const EdgeInsets.symmetric(horizontal: 24.0),
                      //       child: Text(
                      //         'Forgot Password?',
                      //         style: TextStyle(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w700,
                      //           color: Theme.of(context).colorScheme.primary,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(height: 8),
                      AppButton(
                        textString: 'Sign In',
                        onPressed: () => bloc.add(
                          const SignInFormEvent
                              .signInWithEmailAndPasswordPressed(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // const OrDivider(),
                      // const SizedBox(height: 8),
                      // GoogleButton(
                      //   //todo: uncomment below
                      //   onPressed: () => bloc.add(
                      //     const SignInFormEvent.signInWithGooglePressed(),
                      //   ),

                      // onPressed: () {
                      //   print('REMEM => ${state.rememberedEmail}');
                      //   print('Current => ${state.emailAddress.value}');
                      // },
                      // ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () => context.router.pushNamed(rRegister),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const EnjoyNtLogo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
