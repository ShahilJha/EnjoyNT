import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

class CategoryRoundTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String routeLink;

  const CategoryRoundTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.routeLink,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed(routeLink),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 66,
            width: 66,
            decoration: const BoxDecoration(
              color: kWidgetBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Image.asset(
              imageUrl,
              height: 32.0,
              width: 32.0,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
