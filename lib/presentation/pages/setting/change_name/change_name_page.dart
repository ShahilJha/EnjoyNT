import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/change_name_page_scaffold.dart';

@RoutePage()
class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNamePageScaffold();
  }
}
