import 'package:auto_route/auto_route.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/routes/router.dart';
import 'package:enjoy_nt/presentation/utils/utilities.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/category_round_tile.dart';

class ExplorePageContent extends StatelessWidget {
  ExplorePageContent({super.key});

  final List _tileData = [
    {
      'title': 'Jobs',
      'routeLink': rJobListPage,
      'imageUrl': 'assets/icons/jobs.png',
    },
    {
      'title': 'Organization',
      'routeLink': rOraganizationListPage,
      'imageUrl': 'assets/icons/markets.png',
    },
    {
      'title': 'Destination',
      'routeLink': rDestinationListPage,
      'imageUrl': 'assets/icons/tours.png',
    },
    {
      'title': 'Events',
      'routeLink': rEventListPage,
      'imageUrl': 'assets/icons/events.png',
    },
    {
      'title': 'Hotels',
      'routeLink': rHotelListPage,
      'imageUrl': 'assets/icons/hotels.png',
    },
    {
      'title': 'Food',
      'routeLink': '',
      'imageUrl': 'assets/icons/food.png',
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
                  onTap: () {
                    if (data['routeLink'] == '') {
                      getIt<Utilities>()
                          .showSnackBar(text: 'In Development...');
                    } else {
                      context.router.pushNamed(data['routeLink']);
                    }
                  },
                  // routeLink: data['routeLink'],
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
