import 'package:algolia/algolia.dart';
import 'package:config/config.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

// Future<void> _getQueryResults(String queryStr) async {
//   print('QUERY STR =========> $queryStr');
//   AlgoliaQuerySnapshot snap = await getIt<Algolia>()
//       .index('ENJOY_NT_SEARCH')
//       .query(queryStr)
//       .getObjects();
//   snap.hits.asMap().entries.forEach(
//         (element) => print(element),
//       );
//   print(snap.toString());
// }

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
    AlgoliaQuerySnapshot snap =
        await getIt<Algolia>().index('TEST').query(queryStr).getObjects();
    snap.hits.asMap().entries.forEach(
          (element) => print(element.value),
        );
    print(snap.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        onTap: () {
          _getQueryResults('Casuarina');
          showSearch(
            context: context,
            delegate: CustomeSearchDelegate(),
          );
        },
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          iconColor: Theme.of(context).colorScheme.primary,

          hintText: 'Search',

          hintStyle: Theme.of(context).textTheme.bodySmall,
          alignLabelWithHint: true,

          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: kBackgroundInactiveColor,
              width: 1.5,
            ),
          ),
          // hintStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class CustomeSearchDelegate extends SearchDelegate {
  final List<String> searchterms = ['a', 'b'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).colorScheme.primary,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchterms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchterms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
