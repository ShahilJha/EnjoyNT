import 'package:config/config.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  const AppSearchBar({super.key, this.onChanged});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          hintText: 'Search',
          hintStyle: const MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: const MaterialStatePropertyAll<double>(0),
          shape: const MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: kSearchBarborder,
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(
            Icons.search,
            color: kPrimaryColor,
          ),
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
