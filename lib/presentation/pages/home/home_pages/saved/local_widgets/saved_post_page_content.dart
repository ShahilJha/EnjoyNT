import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/utils/utilities.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/app_default_tile.dart';
import '../../../../../widgets/app_search_bar.dart';

class SavedPostPageContent extends StatelessWidget {
  SavedPostPageContent({super.key});

  final List _tileData = [
    {
      'title': 'Jobs',
      'routeLink': '',
      'imageUrl': 'assets/icons/jobs.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     InkWell(
          //       onTap: () => context.router.pop(),
          //       child: Image.asset('assets/icons/back_button.png'),
          //     ),
          //     SizedBox(
          //       width: 290,
          //       height: 40,
          //       child: AppSearchBar(),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: Text(
              'Saved',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              // width: 290,
              height: 40,
              child: AppSearchBar(),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: _tileData.length,
              itemBuilder: (context, index) {
                // final data = _tileData[index];
                return AppDefaultTile(
                  title: 'IT code fair',
                  subTitle: 'Charles Darwin University',
                  detail: 'Hilton Hotel, Darwin CBD, 0800, NT, Australia',
                  imageLink: '',
                  bookmarked: false,
                  onTap: () {
                    getIt<Utilities>().showSnackBar(text: 'In Development....');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
