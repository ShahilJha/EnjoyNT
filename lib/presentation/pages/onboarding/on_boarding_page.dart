import 'package:auto_route/auto_route.dart';
import 'package:enjoy_nt/application/onboarding/bloc/onboard_bloc.dart';
import 'package:enjoy_nt/presentation/core/auth_listener.dart';
import 'package:enjoy_nt/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'local_widgets/category_selection.dart';
import 'local_widgets/interest_selection.dart';
import 'local_widgets/user_type_selection.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: BlocProvider(
        create: (context) => getIt<OnboardBloc>(),
        child: OnBoardingSlider(
          finishButtonText: 'Continue',
          skipTextButton: Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          onFinish: () {
            // context.router.pop();
            // context.router.pushNamed(rHome);
            context.router.replaceAll([const HomeRoute()]);
          },
          finishButtonStyle: FinishButtonStyle(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          //
          trailing: Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {
            context.router.replaceAll([const HomeRoute()]);
            // context.router.pop();
            // context.router.pushNamed(rHome);
          },
          controllerColor: Theme.of(context).colorScheme.primary,
          totalPage: 3,
          headerBackgroundColor: Colors.white,
          pageBackgroundColor: Colors.white,
          background: [
            Image.asset(
              'assets/images/blank_image.png',
              height: 400,
            ),
            Image.asset(
              'assets/images/blank_image.png',
              height: 400,
            ),
            Image.asset(
              'assets/images/blank_image.png',
              height: 400,
            ),
          ],
          speed: 1.8,
          pageBodies: [
            const UserTypeSelection(),
            const CategorySelection(),
            InterestSelection(),
          ],
        ),
      ),
    );
  }
}
