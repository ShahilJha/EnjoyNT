import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/event_list_scafflod.dart';

@RoutePage()
class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EventListScaffold();
  }
}
