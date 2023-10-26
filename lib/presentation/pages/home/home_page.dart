import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/home_page_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePageScaffold();
  }
}
