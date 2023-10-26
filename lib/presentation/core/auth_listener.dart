import 'package:auto_route/auto_route.dart';
import 'package:enjoy_nt/domain/core/services/i_shared_preference_service.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../routes/router.dart';
import '../routes/router.gr.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {
            //do nothing on initial
          },
          authenticated: (_) async {
            // context.router.replaceNamed(rHome);
            bool flag =
                await getIt<ISharedPreferenceService>().checkIfFirstStart();

            if (!flag) {
              context.router.replaceNamed(rOnBoarding);
            } else {
              context.router.replaceNamed(rHome);
            }
          },
          unauthenticated: (_) {
            // context.router.replaceNamed(rLogin);
            context.router.replaceAll([const SignInRoute()]);
          },
        );
      },
      child: child,
    );
  }
}
