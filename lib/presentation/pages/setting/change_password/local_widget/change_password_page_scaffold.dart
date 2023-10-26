import 'package:auto_route/auto_route.dart';
import 'package:enjoy_nt/presentation/utils/utilities.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/auth/i_auth_facade.dart';
import '../../../../../injection.dart';
import '../../../../routes/router.gr.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_text_field.dart';
import '../../../../widgets/in_process_overlay.dart';

class ChangePasswordPageScaffold extends StatefulWidget {
  const ChangePasswordPageScaffold({super.key});

  @override
  State<ChangePasswordPageScaffold> createState() =>
      _ChangePasswordPageScaffoldState();
}

class _ChangePasswordPageScaffoldState
    extends State<ChangePasswordPageScaffold> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller_second = TextEditingController();
  bool isSubmitting = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                    controller: controller,
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
                    controller: controller_second,
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
                    onPressed: () async {
                      // print('================> ${controller.text}');
                      setState(() {
                        isSubmitting = true;
                      });
                      if (controller.text != controller_second.text) {
                        getIt<Utilities>()
                            .showSnackBar(text: 'Mismatch password');
                      } else if (controller.text.length < 6 ||
                          controller_second.text.length < 6) {
                        getIt<Utilities>()
                            .showSnackBar(text: 'Invalid password length');
                      } else {
                        await getIt<IAuthFacade>()
                            .updateUserPassword(password: controller.text);
                        context.router.popAndPushAll([HomeRoute()]);
                      }

                      setState(() {
                        isSubmitting = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        InProcessOverlay(inProcess: isSubmitting),
      ],
    );
  }
}
