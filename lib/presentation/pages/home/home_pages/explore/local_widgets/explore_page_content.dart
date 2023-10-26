import 'package:flutter/material.dart';

import '../../../../../widgets/category_round_tile.dart';

class ExplorePageContent extends StatelessWidget {
  ExplorePageContent({super.key});

  final List _tileData = [
    {
      'title': 'Jobs',
      'routeLink': '',
      'imageUrl': 'assets/icons/jobs.png',
    },
    {
      'title': 'Food',
      'routeLink': '',
      'imageUrl': 'assets/icons/food.png',
    },
    {
      'title': 'Tours',
      'routeLink': '',
      'imageUrl': 'assets/icons/tours.png',
    },
    {
      'title': 'Events',
      'routeLink': '',
      'imageUrl': 'assets/icons/events.png',
    },
    {
      'title': 'Hotels',
      'routeLink': '',
      'imageUrl': 'assets/icons/hotels.png',
    },
    {
      'title': 'Bus',
      'routeLink': '',
      'imageUrl': 'assets/icons/bus.png',
    },
    {
      'title': 'Camping',
      'routeLink': '',
      'imageUrl': 'assets/icons/camping.png',
    },
    {
      'title': 'Taxi',
      'routeLink': '',
      'imageUrl': 'assets/icons/taxi.png',
    },
    {
      'title': 'Bars',
      'routeLink': '',
      'imageUrl': 'assets/icons/bars.png',
    },
    {
      'title': 'Markets',
      'routeLink': '',
      'imageUrl': 'assets/icons/markets.png',
    },
    {
      'title': 'ATMs',
      'routeLink': '',
      'imageUrl': 'assets/icons/atms.png',
    },
    {
      'title': 'Wildlife',
      'routeLink': '',
      'imageUrl': 'assets/icons/wildlife.png',
    },
    {
      'title': 'Hospitals',
      'routeLink': '',
      'imageUrl': 'assets/icons/hospitals.png',
    },
    {
      'title': 'Charity',
      'routeLink': '',
      'imageUrl': 'assets/icons/charity.png',
    },
    {
      'title': 'Welfare',
      'routeLink': '',
      'imageUrl': 'assets/icons/welfare.png',
    },
    {
      'title': 'Safety',
      'routeLink': '',
      'imageUrl': 'assets/icons/safety.png',
    },
    {
      'title': 'Indigenous',
      'routeLink': '',
      'imageUrl': 'assets/icons/indigenous.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Explore',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: _tileData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 13,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final data = _tileData[index];
                return CategoryRoundTile(
                  title: data['title'],
                  routeLink: data['routeLink'],
                  imageUrl: data['imageUrl'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
