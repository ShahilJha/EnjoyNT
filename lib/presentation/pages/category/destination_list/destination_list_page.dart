import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/destination_list_scafflod.dart';

@RoutePage()
class DestinationListPage extends StatelessWidget {
  const DestinationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DestinationListScaffold();
  }
}
