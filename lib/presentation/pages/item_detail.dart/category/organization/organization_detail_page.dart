import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_chip.dart';

@RoutePage()
class OrganizationDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const OrganizationDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.network(
                data['organisation_image'],
                fit: BoxFit.contain,
              ),
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
                    data['organisation_name'],
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Location: ${data["organisation_location"]}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                    data['organisation_detail'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text(
                    "Other Details",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) => ingredients(context, ),
                  // ),
                  Column(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ingredients(context,
                          'Cost: \$${data["destination_cost"] ?? "None"}'),
                      ingredients(context, 'Opening Hours:'),

                      ingredients2(context,
                          'Monday: ${data["organisation_opening_hours"]["Monday"] ?? "None"}'),
                      ingredients2(context,
                          'Tuesday: ${data["organisation_opening_hours"]["Tuesday"] ?? "None"}'),
                      ingredients2(context,
                          'Wednesday: ${data["organisation_opening_hours"]["Wednesday"] ?? "None"}'),
                      ingredients2(context,
                          'Thursday: ${data["organisation_opening_hours"]["Thursday"] ?? "None"}'),
                      ingredients2(context,
                          'Friday: ${data["organisation_opening_hours"]["Friday"] ?? "None"}'),
                      ingredients2(context,
                          'Saturday: ${data["organisation_opening_hours"]["Saturday"] ?? "None"}'),
                      ingredients2(context,
                          'Sunday: ${data["organisation_opening_hours"]["Sunday"] ?? "None"}'),
                      // ingredients(context,
                      //     'Accessibility Disabled: ${data["event_accessibility"]["accessibility_disabled"] == "true" ? "True" : "False" ?? "None"}'),
                      // ingredients(context,
                      //     'Accessibility Food: ${data["event_accessibility"]["accessibility_food"] == "true" ? "True" : "False" ?? "None"}'),
                      // ingredients(context,
                      //     'Accessibility Parking: ${data["event_accessibility"]["accessibility_parking"] == "true" ? "True" : "False" ?? "None"}'),
                      // ingredients(context,
                      //     'Accessibility Toilet: ${data["event_accessibility"]["accessibility_Toilet"] == "true" ? "True" : "False" ?? "None"}'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  // Text(
                  //   "Steps",
                  //   style: Theme.of(context).textTheme.displayMedium,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) => steps(context, index),
                  // ),
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
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Wrap(
            children: [
              ...(data["organisation_type"] as List)
                  .map((item) => item as String)
                  .toList()
                  .map(
                    (item) => AppChip(
                      title: item,
                      onPressed: () {},
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  ingredients(BuildContext context, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.arrow_forward_rounded,
              size: 15,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  ingredients2(BuildContext context, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        children: [
          const SizedBox(width: 35),
          CircleAvatar(
            radius: 8,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.arrow_right,
              size: 15,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data,
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
