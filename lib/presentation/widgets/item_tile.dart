import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  final Color altImageColor;

  const ItemTile({
    super.key,
    required this.imageUrl,
    required this.title,
    this.altImageColor = kLogoutButtonColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.0,
              width: 221.0,
              decoration: BoxDecoration(
                //todo: check this the altImageColor is not being taken as value
                // color: altImageColor,
                color: kLogoutButtonColor.withOpacity(0.05),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              //todo: undo comment to see image
              child: imageUrl.isEmpty
                  ? const Center(
                      child: Text(
                        'image',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.network(
                        imageUrl,
                        height: 120.0,
                        width: 221.0,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 221.0,
              child: Text(
                title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
