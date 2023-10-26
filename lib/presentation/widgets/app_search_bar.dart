import 'package:algolia/algolia.dart';
import 'package:config/config.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  const AppSearchBar({super.key, this.onChanged});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  List _queryResults = [];

  Future<void> _getQueryResults(String queryStr) async {
    print('QUERY STR =========> $queryStr');
    AlgoliaQuerySnapshot snap = await getIt<Algolia>()
        .index('ENJOY_NT_SEARCH')
        .query(queryStr)
        .getObjects();
    snap.hits.asMap().entries.forEach(
          (element) => print(element),
        );
    print(snap.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: SearchAnchor(
          isFullScreen: false,
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
                print('PRESSED onTap ==============> ${controller.text}');
              },
              onChanged: (value) {
                print(
                    'PRESSED onCHnaged ==============> ${controller.value.text}');
                print('QUERY VALUE STR =========> $value');

                _getQueryResults(value);
              },
              onSubmitted: (value) => _getQueryResults,
              leading: const Icon(
                Icons.search,
                color: kPrimaryColor,
              ),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  print('============> ${controller.text}');
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
