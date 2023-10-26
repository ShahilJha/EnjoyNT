import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_text_field.dart';
import '../../../../widgets/enjoy_nt_logo.dart';
import '../../../../widgets/google_button.dart';
import '../../../../widgets/or_divider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignUpFormBloc>();
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Create an Account",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Fill in the details below or register with \nyour google acount",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.normal,
                        // controller: emailController,
                        autoFocus: true,
                        icon: Icons.person,
                        labelText: "Username",
                        hintText: "John Doe",
                        // onChanged: (value) => {},

                        onChanged: (value) =>
                            bloc.add(SignUpFormEvent.userNameChanged(value)),
                        validator: (_) => bloc.state.userName.value.fold(
                          //left Failure
                          (leftFailure) => leftFailure.maybeMap(
                            auth: (failure) => failure.authFailure.maybeMap(
                              invalidUserName: (_) => 'Invlid Username',
                              orElse: () => null,
                            ),
                            orElse: () => null,
                          ),
                          //right value
                          (_) => null,
                        ),
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.email,
                        // controller: emailController,
                        // autoFocus: true,
                        onSuffixIconPressed: () => bloc.add(
                          const SignUpFormEvent.clearEmailAddress(),
                        ),
                        onChanged: (value) =>
                            bloc.add(SignUpFormEvent.emailChanged(value)),
                        validator: (_) => bloc.state.emailAddress.value.fold(
                          //left Failure
                          (leftFailure) => leftFailure.maybeMap(
                            auth: (failure) => failure.authFailure.maybeMap(
                              invalidEmail: (_) => 'Invalid Email',
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
                        disableUnobscurePassword: true,
                        onChanged: (value) =>
                            bloc.add(SignUpFormEvent.passwordChanged(value)),
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
                      AppTextField(
                        labelText: 'Re-Password',
                        textFieldType: TextFieldType.password,
                        disableUnobscurePassword: true,
                        onChanged: (value) =>
                            bloc.add(SignUpFormEvent.rePasswordChanged(value)),
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
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: false,
                            // onChanged: (value) => bloc
                            //     .add(SignInFormEvent.toggleRememberMe(value!)),
                            onChanged: (value) => {},
                          ),
                          Text(
                            "Agree with our Terms & Condition",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "Terms & Condition",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                        textString: 'Sign Up',
                        onPressed: () => bloc.add(
                          const SignUpFormEvent
                              .registerWithEmailAndPasswordPressed(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const OrDivider(),
                      const SizedBox(height: 8),
                      GoogleButton(
                        //todo: uncomment below
                        onPressed: () => {
                          //   bloc.add(
                          //   const SignInFormEvent.signInWithGooglePressed(),
                          // );
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          GestureDetector(
                            onTap: () => context.router.pop(),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
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
