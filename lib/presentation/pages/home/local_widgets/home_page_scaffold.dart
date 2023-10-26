import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../home_pages/explore/explore_page.dart';
import '../home_pages/profile/profile_page.dart';
import '../home_pages/saved/saved_post_page.dart';
import 'home_page_content.dart';

class HomePageScaffold extends StatefulWidget {
  const HomePageScaffold({super.key});

  @override
  State<HomePageScaffold> createState() => _HomePageScaffoldState();
}

class _HomePageScaffoldState extends State<HomePageScaffold> {
  int _currentIndex = 0;

  Widget _getCurrentPage(int index) {
    switch (index) {
      case 1:
        return const ExplorePage();
      case 2:
        return const SavedPostPage();
      case 3:
        return const ProfilePage();
      case 0:
      default:
        return const HomePageContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: GNav(
            gap: 8,
            backgroundColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).scaffoldBackgroundColor,
            activeColor: Theme.of(context).scaffoldBackgroundColor,
            tabBackgroundColor: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.travel_explore_rounded,
                text: 'Discover',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Saved',
              ),
              GButton(
                icon: Icons.person_pin,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: _getCurrentPage(_currentIndex),
      ),
    );
  }
}
