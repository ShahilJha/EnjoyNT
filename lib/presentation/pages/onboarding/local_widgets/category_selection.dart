import 'package:flutter/material.dart';

import '../../../widgets/enjoy_nt_logo.dart';
import 'on_board_tile.dart';

class CategorySelection extends StatelessWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EnjoyNtLogo(),
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you looking for . . . .?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5 / 2,
                crossAxisCount: 2,
                children: [
                  OnBoardTile(
                    imageUrl: 'assets/images/image5.png',
                    title: 'Jobs',
                  ),
                  OnBoardTile(
                    imageUrl: 'assets/images/image6.png',
                    title: 'Tours',
                  ),
                  OnBoardTile(
                    imageUrl: 'assets/images/image7.png',
                    title: 'Hotels/Restaurants',
                  ),
                  OnBoardTile(
                    imageUrl: 'assets/images/image8.png',
                    title: 'Events',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
