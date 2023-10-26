import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/injection.dart';
import 'package:enjoy_nt/presentation/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../routes/router.dart';
import '../../../../../widgets/list_content_template.dart';
import 'recent_activities_tile.dart';

class ProfilePageContent extends StatelessWidget {
  ProfilePageContent({super.key});

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: Text(
              'My Profile',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 26,
                  child: Image.asset(
                    'assets/avatars/male_avatar.png',
                    height: 64,
                    width: 64,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getIt<FirebaseAuth>().currentUser?.displayName ??
                                'Username',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            getIt<FirebaseAuth>().currentUser?.email ??
                                'Student',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () => context.router.pushNamed(rSetting),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListContentTemplate(
            title: 'Recent Activities',
            onTap: () => context.router.pushNamed(rEventListPage),
            child: StreamBuilder(
                stream:
                    getIt<FirebaseFirestore>().collection('events').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary),
                    );
                  }

                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      itemBuilder: (context, index) {
                        // final data = _tileData[index];
                        final data = snapshot.data?.docs[index].data();

                        return RecentActivityTile(
                          onTap: () => context.router
                              .push(EventDetailRoute(data: data!)),
                          title: data?["event_name"],
                          subTitle: '@${data?["event_location"]}',
                          tagList: (data?["event_tags"] as List)
                              .map((item) => item as String)
                              .toList(),
                        );
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
