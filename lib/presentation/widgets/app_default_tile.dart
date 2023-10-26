import 'package:config/config.dart';
import 'package:flutter/material.dart';

class AppDefaultTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String detail;
  final String imageLink;
  final bool bookmarked;
  final VoidCallback onTap;
  const AppDefaultTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.detail,
    this.bookmarked = false,
    required this.imageLink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 160,
        margin: const EdgeInsets.only(bottom: 10),
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
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.04),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: imageLink.isEmpty
                    ? Center(
                        child: Text(
                          'image',
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        child: Image.network(
                          imageLink,
                          fit: BoxFit.contain,
                        ),
                      ),
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
                      maxLines: 1,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 13),
                    Text(
                      detail,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(
                    //         bookmarked
                    //             ? Icons.bookmark
                    //             : Icons.bookmark_outline,
                    //         color: Theme.of(context).colorScheme.primary,
                    //         size: 24,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 13)
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
