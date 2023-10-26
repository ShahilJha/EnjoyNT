import 'package:config/config.dart';
import 'package:flutter/material.dart';

class OnBoardTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;
  final VoidCallback onTap;
  final Color textColor;
  const OnBoardTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.color,
    required this.onTap,
    this.textColor = kBackgroundInactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5,
        color: color,
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
                        color: textColor,
                        fontSize: 14,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
