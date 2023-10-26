import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_text_field.dart';

class ChangePasswordPageScaffold extends StatelessWidget {
  const ChangePasswordPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.router.pop(),
                    child: Image.asset('assets/icons/back_button.png'),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 45),
              Text(
                'Change Password',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Ensure that you have meet the password conditions (At least 8 digits, 1 number, 1 special character,and 1 capital letter)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              AppTextField(
                textFieldType: TextFieldType.password,
                disableUnobscurePassword: true,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                onChanged: (value) {},
                // onChanged: (value) =>
                //     bloc.add(SignUpFormEvent.passwordChanged(value)),
                // validator: (_) => bloc.state.password.value.fold(
                //   (leftFailure) => leftFailure.maybeMap(
                //     auth: (failure) => failure.authFailure.maybeMap(
                //       shortPassword: (_) => 'Invalid Password',
                //       orElse: () => null,
                //     ),
                //     orElse: () => null,
                //   ),
                //   (_) => null,
                // ),
              ),
              const SizedBox(height: 18),
              AppTextField(
                labelText: 'Re-Password',
                textFieldType: TextFieldType.password,
                disableUnobscurePassword: true,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                onChanged: (value) {},
                // onChanged: (value) =>
                //     bloc.add(SignUpFormEvent.rePasswordChanged(value)),
                // validator: (_) => bloc.state.password.value.fold(
                //   (leftFailure) => leftFailure.maybeMap(
                //     auth: (failure) => failure.authFailure.maybeMap(
                //       shortPassword: (_) => 'Invalid Password',
                //       orElse: () => null,
                //     ),
                //     orElse: () => null,
                //   ),
                //   (_) => null,
                // ),
              ),
              const SizedBox(height: 20),
              AppButton(
                textString: 'Save',
                margin: const EdgeInsets.all(0),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
