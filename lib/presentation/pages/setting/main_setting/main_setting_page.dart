import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widget/main_setting_scafflod.dart';

@RoutePage()
class MainSettingPage extends StatelessWidget {
  const MainSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainSettingScaffold();
  }
}
