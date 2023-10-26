import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../../injection.dart';
import '../../../core/auth_listener.dart';
import '../../../widgets/in_process_overlay.dart';
import 'local_widgets/sign_in_page_scaffold.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: BlocProvider(
        create: (context) => getIt<SignInFormBloc>()
          ..add(const SignInFormEvent.checkRememberedEmail()),
        child: BlocBuilder<SignInFormBloc, SignInFormState>(
          buildWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return Stack(
              children: [
                const SignInPageScaffold(),
                InProcessOverlay(inProcess: state.isSubmitting)
              ],
            );
          },
        ),
      ),
    );
  }
}
