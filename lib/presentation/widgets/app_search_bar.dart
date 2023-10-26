import 'dart:convert';

import 'package:algolia/algolia.dart';
import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/routes/router.gr.dart';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        onTap: () async {
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
  final List<String> searchterms = [];

  Future<List> _getQueryResults(String queryStr) async {
    AlgoliaQuerySnapshot snap =
        await getIt<Algolia>().index('TEST').query(queryStr).getObjects();
    // snap.hits.asMap().entries.forEach(
    //       (element) => print('EACH => ${element.value}'),
    //     );
    return snap.hits;
  }

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

  String _getItemName(dynamic values, String type) {
    switch (type) {
      case 'organisation':
        return values['organisation_name'];
      case 'events':
        return values['event_name'];
      case 'destination':
        return values['destination_name'];
      case 'jobs':
        return values['job_title'];
      case 'hotel':
      default:
        return values['hotel_name'];
    }
  }

  void _goToPage(BuildContext context, dynamic data, String type) {
    switch (type) {
      case 'organisation':
        context.router.push(OrganizationDetailRoute(data: data!));
      // return values['organisation_name'];
      case 'events':
        context.router.push(EventDetailRoute(data: data!));

      // return values['event_name'];
      case 'destination':
        context.router.push(DestinationDetailRoute(data: data!));

      // return values['destination_name'];
      case 'jobs':
        context.router.push(JobsDetailRoute(data: data!));

      // return values['job_title'];
      case 'hotel':
      default:
        context.router.push(HotelDetailRoute(data: data!));

      // return values['hotel_name'];
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> matchQuery = [];
    // for (var item in searchterms) {
    //   if (item.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(item);
    //   }
    // }
    return FutureBuilder(
        future: _getQueryResults(query),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          }
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              var result = data?[index].data;
              String resultId = data?[index].data['id'];
              String resultType = data?[index].data['type'];
              return ListTile(
                onTap: () => _goToPage(context, result, resultType),
                title: Text(_getItemName(result, resultType)),
                subtitle: Text(resultType),
              );
            },
          );
        });
  }
}
