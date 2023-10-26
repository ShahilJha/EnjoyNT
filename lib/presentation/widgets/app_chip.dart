import 'package:config/config.dart';
import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  final String title;
  const AppChip({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Chip(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const StadiumBorder(
          side: BorderSide(
            color: kSearchBarborder,
          ),
        ),
        label: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
