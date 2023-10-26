import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'local_widgets/category_selection.dart';
import 'local_widgets/interest_selection.dart';
import 'local_widgets/user_type_selection.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Log in',
      // skipTextButton: Text(
      //   'Skip',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: Theme.of(context).colorScheme.primary,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      onFinish: () {
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) => const RegisterPage(),
        //   ),
        // );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      //
      trailing: Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        print('dex nuts');
        // Navigator.push(
        //   context,
        //   CupertinoPageRoute(
        //     builder: (context) => const LoginPage(),
        //   ),
        // );
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
    );
  }
}
