import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_chip.dart';

@RoutePage()
class ItemDetailPage extends StatelessWidget {
  ItemDetailPage({super.key});

  final _tagData = [
    'Camping',
    'Hiking',
    'Wildlife',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/images/image1.png"),
            ),
            buttonArrow(context),
            scroll(),
          ],
        ),
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => context.router.pop(),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              // child: Icon(
              //   Icons.arrow_back_ios,
              //   size: 20,
              //   // color: Colors.white,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
              child: Image.asset('assets/icons/back_button.png'),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Cacao Maca Walnut Milk",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Food .60 min",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Row(
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         // Navigator.push(
                  //         //     context,
                  //         //     MaterialPageRoute(
                  //         //       builder: (context){ =>
                  //         //           ProfileTap(showFollowBottomInProfile: true)},
                  //         //     ));
                  //       },
                  //       child: const CircleAvatar(
                  //         radius: 25,
                  //         backgroundImage:
                  //             AssetImage("assets/avatars/male_avatar.png"),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       "John Doe",
                  //       style: Theme.of(context).textTheme.bodyLarge,
                  //     ),
                  //     const Spacer(),
                  //     CircleAvatar(
                  //       radius: 25,
                  //       backgroundColor: Theme.of(context).colorScheme.primary,
                  //       child: const Icon(
                  //         Icons.favorite,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       "273 Likes",
                  //       style: Theme.of(context).textTheme.bodyLarge,
                  //     ),
                  //   ],
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  tags(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 2,
                    ),
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => ingredients(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Steps",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) => steps(context, index),
                  ),
                ],
              ),
            ),
          );
        });
  }

  tags(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tags',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Wrap(
            children: [
              ..._tagData.map(
                (item) => AppChip(title: item),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ingredients(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.done,
              size: 15,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "4 Eggs",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  steps(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
