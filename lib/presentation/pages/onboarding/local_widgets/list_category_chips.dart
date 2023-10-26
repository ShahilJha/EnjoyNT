import 'package:flutter/material.dart';

import '../../../widgets/app_chip.dart';

class ListCategoryChips extends StatelessWidget {
  final String categoryTitle;
  final List<String> categoryData;
  final VoidCallback onPressed;

  const ListCategoryChips({
    super.key,
    required this.categoryTitle,
    required this.categoryData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Wrap(
            children: [
              ...categoryData.map(
                (item) => AppChip(
                  title: item,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
