import 'package:config/config.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/app_chip.dart';

class RecentActivityTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<String> tagList;
  final VoidCallback onTap;
  const RecentActivityTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.tagList,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          border: Border.all(
            color: kSearchBarborder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return AppChip(
                    onPressed: () {},
                    title: tagList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
