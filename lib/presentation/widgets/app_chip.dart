import 'package:config/config.dart';
import 'package:flutter/material.dart';

class AppChip extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  const AppChip({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  State<AppChip> createState() => _AppChipState();
}

class _AppChipState extends State<AppChip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: ActionChip(
        onPressed: () {
          print('pressed button');
          setState(() {
            selected = !selected;
          });
        },
        elevation: 0,
        backgroundColor: selected
            ? Theme.of(context).colorScheme.primary.withAlpha(180)
            : Theme.of(context).scaffoldBackgroundColor,
        shape: const StadiumBorder(
          side: BorderSide(
            color: kSearchBarborder,
          ),
        ),
        label: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: selected ? Colors.white : kBackgroundInactiveColor,
              ),
        ),
      ),
    );
  }
}
