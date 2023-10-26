import 'package:enjoy_nt/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_search_bar.dart';
import '../../../widgets/category_round_tile.dart';
import '../../../widgets/item_tile.dart';
import '../../../widgets/list_content_template.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

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
          const ListContentTemplate(
            title: 'Categories',
            seeAllRoute: '',
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryRoundTile(
                    title: 'Jobs',
                    routeLink: '',
                    imageUrl: 'assets/icons/jobs.png',
                  ),
                  CategoryRoundTile(
                    title: 'Food',
                    routeLink: '',
                    imageUrl: 'assets/icons/food.png',
                  ),
                  CategoryRoundTile(
                    title: 'Tours',
                    routeLink: '',
                    imageUrl: 'assets/icons/tours.png',
                  ),
                  CategoryRoundTile(
                    title: 'Events',
                    routeLink: '',
                    imageUrl: 'assets/icons/events.png',
                  ),
                ],
              ),
            ),
          ),
          ListContentTemplate(
            title: 'Popular Destination',
            seeAllRoute: '',
            child: SizedBox(
              height: 155,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
                  ),
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
                  ),
                ],
              ),
            ),
          ),
          ListContentTemplate(
            title: 'Popular Events',
            seeAllRoute: '',
            child: SizedBox(
              height: 155,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
                  ),
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
                  ),
                ],
              ),
            ),
          ),
          ListContentTemplate(
            title: 'Jobs Available',
            seeAllRoute: '',
            child: SizedBox(
              height: 155,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
                  ),
                  ItemTile(
                    imageUrl: '',
                    title: 'Title',
                    routeLink: '',
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
