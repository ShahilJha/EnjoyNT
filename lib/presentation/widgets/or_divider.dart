import 'package:config/config.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 25.0, right: 10.0),
            child: const Divider(),
          ),
        ),
        const Text(
          'OR',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kBackgroundInactiveColor,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 25.0),
            child: const Divider(),
          ),
        ),
      ],
    );
  }
}
