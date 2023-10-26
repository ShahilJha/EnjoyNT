import 'package:config/config.dart';
import 'package:flutter/material.dart';

class OnBoardTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  const OnBoardTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(imageUrl),
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: kBackgroundInactiveColor,
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
