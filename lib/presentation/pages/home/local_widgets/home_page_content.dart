import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../routes/router.dart';
import '../../../widgets/app_search_bar.dart';
import '../../../widgets/category_round_tile.dart';
import '../../../widgets/item_tile.dart';
import '../../../widgets/list_content_template.dart';

class HomePageContent extends StatelessWidget {
  final VoidCallback onTap;
  const HomePageContent({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            height: 270.0,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Hi, ${getIt<FirebaseAuth>().currentUser?.displayName?.split(' ')[0] ?? 'User'}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Let’s explore the Northern Territory',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const AppSearchBar(),
                  // SizedBox(
                  //   height: 40,
                  //   child: TextField(
                  //     textAlign: TextAlign.start,
                  //     textAlignVertical: TextAlignVertical.center,
                  //     decoration: const InputDecoration(
                  //         hintText: 'Search',
                  //         contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                  //     onChanged: (value) {},
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListContentTemplate(
            title: 'Categories',
            onTap: onTap,
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryRoundTile(
                    title: 'Jobs',
                    onTap: () => context.router.pushNamed(rJobListPage),
                    imageUrl: 'assets/icons/jobs.png',
                  ),
                  CategoryRoundTile(
                    title: 'Organization',
                    onTap: () =>
                        context.router.pushNamed(rOraganizationListPage),
                    imageUrl: 'assets/icons/markets.png',
                  ),
                  CategoryRoundTile(
                    title: 'Destination',
                    onTap: () => context.router.pushNamed(rDestinationListPage),
                    imageUrl: 'assets/icons/tours.png',
                  ),
                  CategoryRoundTile(
                    title: 'Events',
                    onTap: () => context.router.pushNamed(rEventListPage),
                    imageUrl: 'assets/icons/events.png',
                  ),
                ],
              ),
            ),
          ),
          ListContentTemplate(
            title: 'Popular Destination',
            onTap: () => context.router.pushNamed(rDestinationListPage),
            child: SizedBox(
              height: 155,
              child: StreamBuilder(
                  stream: getIt<FirebaseFirestore>()
                      .collection('destination')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      itemBuilder: (context, index) {
                        // final data = _tileData[index];
                        // <DocumentSnapshot> items = snapshot.data?.documents;
                        final data = snapshot.data?.docs[index].data();
                        return ItemTile(
                          imageUrl: data?["destination_image"],
                          title: data?["destination_name"],
                          onTap: () {},
                        );
                      },
                    );
                  }),
            ),
          ),
          ListContentTemplate(
            title: 'Popular Events',
            onTap: () => context.router.pushNamed(rEventListPage),
            child: SizedBox(
              height: 155,
              child: StreamBuilder(
                  stream: getIt<FirebaseFirestore>()
                      .collection('events')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      itemBuilder: (context, index) {
                        // final data = _tileData[index];
                        // <DocumentSnapshot> items = snapshot.data?.documents;
                        final data = snapshot.data?.docs[index].data();
                        return ItemTile(
                          imageUrl: data?["image"],
                          title: data?["event_name"],
                          onTap: () {},
                        );
                      },
                    );
                  }),
            ),
          ),
          ListContentTemplate(
            title: 'Jobs Available',
            onTap: () => context.router.pushNamed(rJobListPage),
            child: SizedBox(
              height: 155,
              child: StreamBuilder(
                  stream:
                      getIt<FirebaseFirestore>().collection('jobs').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      itemBuilder: (context, index) {
                        // final data = _tileData[index];
                        // <DocumentSnapshot> items = snapshot.data?.documents;
                        final data = snapshot.data?.docs[index].data();
                        return ItemTile(
                          imageUrl: data?["job_image"],
                          title: data?["job_title"],
                          onTap: () {},
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
