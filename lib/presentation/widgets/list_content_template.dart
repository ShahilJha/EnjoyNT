import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

class ListContentTemplate extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String seeAllRoute;

  const ListContentTemplate({
    super.key,
    required this.child,
    required this.title,
    required this.seeAllRoute,
    this.padding = const EdgeInsets.symmetric(horizontal: 25),
    this.margin = const EdgeInsets.symmetric(vertical: 23),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () => context.router.pushNamed(seeAllRoute),
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kLogoutButtonColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          child,
        ],
      ),
    );
  }
}
