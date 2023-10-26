import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/hotel_list_scafflod.dart';

@RoutePage()
class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HotelListScaffold();
  }
}
