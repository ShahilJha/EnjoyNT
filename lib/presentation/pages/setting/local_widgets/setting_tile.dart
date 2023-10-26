import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String routeUrl;
  final String title;
  final IconData icon;
  const SettingTile({
    super.key,
    required this.routeUrl,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed(routeUrl),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        height: 40,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 8,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black,
                    ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).colorScheme.primary,
                size: 33,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
