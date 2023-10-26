import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          minimumSize: const Size.fromHeight(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          textStyle: TextStyle(
            fontSize: ResponsiveValue(
              context,
              defaultValue: 14.0,
              conditionalValues: [
                Condition.smallerThan(name: MOBILE, value: 15.0),
                Condition.largerThan(name: TABLET, value: 25.0)
              ],
            ).value,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/google_logo.png',
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 3),
            Text(
              'Sign in with Google',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
