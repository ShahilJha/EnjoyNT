import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/firestore_data/i_firestore_data_facade.dart';
import '../../../../widgets/app_default_tile.dart';
import '../../../../widgets/app_search_bar.dart';

class DestinationListScaffold extends StatelessWidget {
  DestinationListScaffold({super.key});

  final List _tileData = [
    {
      'title': 'Jobs',
      'routeLink': '',
      'imageUrl': 'assets/icons/jobs.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => context.router.pop(),
                  child: Image.asset('assets/icons/back_button.png'),
                ),
                const SizedBox(
                  width: 290,
                  height: 40,
                  child: AppSearchBar(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Text(
                'Destinations',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),

            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24),
            //   child: SizedBox(
            //     // width: 290,
            //     height: 40,
            //     child: AppSearchBar(),
            //   ),
            // ),
            // const SizedBox(height: 25),
            StreamBuilder(
                stream: getIt<FirebaseFirestore>()
                    .collection('destination')
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.size,
                        itemBuilder: (context, index) {
                          // final data = _tileData[index];
                          // <DocumentSnapshot> items = snapshot.data?.documents;
                          final data = snapshot.data?.docs[index].data();
                          return AppDefaultTile(
                            title: data?["destination_name"],
                            subTitle: 'Cost: \$${data?["destination_cost"]}',
                            detail: data?["destination_location"],
                            imageLink: data?["destination_image"],
                            bookmarked: false,
                            onTap: () => context.router
                                .push(DestinationDetailRoute(data: data!)),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
