import 'package:config/config.dart';
import 'package:flutter/material.dart';

class AppDefaultTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String detail;
  final String imageLink;
  final bool bookmarked;
  const AppDefaultTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.detail,
    this.bookmarked = false,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        border: Border.all(
          color: kSearchBarborder,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 140,
              width: 140,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: imageLink.isEmpty
                  ? Center(
                      child: Text(
                        'image',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  : Image.network('src'),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              // color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 13),
                  Text(
                    detail,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.fade,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          bookmarked ? Icons.bookmark : Icons.bookmark_outline,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 13)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
