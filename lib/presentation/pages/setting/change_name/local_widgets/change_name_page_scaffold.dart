import 'package:auto_route/auto_route.dart';
import 'package:enjoy_nt/domain/auth/i_auth_facade.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_text_field.dart';
import '../../../../widgets/in_process_overlay.dart';

class ChangeNamePageScaffold extends StatefulWidget {
  const ChangeNamePageScaffold({super.key});

  @override
  State<ChangeNamePageScaffold> createState() => _ChangeNamePageScaffoldState();
}

class _ChangeNamePageScaffoldState extends State<ChangeNamePageScaffold> {
  TextEditingController controller = TextEditingController();
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
                    'Change name',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Change the display name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 18),
                  AppTextField(
                    textFieldType: TextFieldType.normal,
                    controller: controller,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    icon: Icons.person,
                    labelText: "Username",
                    hintText: "John Doe",
                    onChanged: (value) => {},

                    // onChanged: (value) =>
                    //     bloc.add(SignUpFormEvent.emailChanged(value)),
                    // validator: (_) => bloc.state.emailAddress.value.fold(
                    //   //left Failure
                    //   (leftFailure) => leftFailure.maybeMap(
                    //     auth: (failure) => failure.authFailure.maybeMap(
                    //       invalidEmail: (_) => 'Invlid Email',
                    //       orElse: () => null,
                    //     ),
                    //     orElse: () => null,
                    //   ),
                    //   //right value
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
                      await getIt<IAuthFacade>()
                          .updateUserName(name: controller.text);
                      setState(() {
                        isSubmitting = false;
                      });
                      context.router.popAndPushAll([HomeRoute()]);
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
