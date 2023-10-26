import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../../../injection.dart';
import '../../../core/auth_listener.dart';
import '../../../widgets/in_process_overlay.dart';
import 'local_widgets/sign_up_page_scaffold.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: BlocProvider(
        create: (context) => getIt<SignUpFormBloc>(),
        child: BlocBuilder<SignUpFormBloc, SignUpFormState>(
          buildWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return Stack(
              children: [
                const SignUpPageScaffold(),
                InProcessOverlay(inProcess: state.isSubmitting),
              ],
            );
          },
        ),
      ),
    );
  }
}
