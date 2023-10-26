import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/auth_listener.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -116.0,
              left: -44.0,
              child: Container(
                height: 386,
                width: 386,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary.withAlpha(175),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 40,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enjoy',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'NT',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 32,
                          ),
                    ),
                  ],
                ),
              ),
              // child: Image.asset(
              //   'assets/logo/logo.png',
              //   height: 128.0,
              //   width: 128.0,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
