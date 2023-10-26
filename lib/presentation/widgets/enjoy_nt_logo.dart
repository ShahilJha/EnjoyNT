import 'package:flutter/material.dart';

class EnjoyNtLogo extends StatelessWidget {
  const EnjoyNtLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Enjoy',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          'NT',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
