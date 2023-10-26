import 'package:flutter/material.dart';

import '../../../widgets/enjoy_nt_logo.dart';
import 'list_category_chips.dart';

class InterestSelection extends StatelessWidget {
  InterestSelection({super.key});
  final Map _dataList = {
    'Jobs': [
      'Full time',
      'Part time',
      'Casual',
      'Contract',
      'Internship',
    ],
    'Travel': [
      'Camping',
      'Sight Seeing',
      'Natural Parks',
      'Hiking',
      'Religious',
      'Indigenous',
      'World War',
      'Lakes/Springs',
      'Wildlife',
    ],
    'Hotels/Resturants': [
      'Luxury',
      'Budget',
      'Pokies',
      'Bar',
      'Sports bar',
      'Casino',
      'Fine Dining',
      'Fast food',
      'Coffee',
      'Indian',
      'Breakfast',
      'Chinese',
      'Kebab',
      'Boba',
      'Vegan',
      'Dinner',
      'Sea food',
      'Italian',
      'Hostels',
    ],
    'Events': [
      'Meet & Greet',
      'Professional',
      'Concerts',
      'Nightlife',
      'Non Profit',
      'Career',
      'Health',
      'Markets',
      'Cultural',
      'Sports',
    ],
  };

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
                    'You are intrested in . . . .?',
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
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView(
                  shrinkWrap: true,
                  children: _dataList.entries
                      .map(
                        (category) => ListCategoryChips(
                          categoryTitle: category.key,
                          categoryData: category.value,
                          onPressed: () {},
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
