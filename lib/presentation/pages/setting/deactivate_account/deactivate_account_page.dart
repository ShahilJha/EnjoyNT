import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/deactivate_account_page_scaffold.dart';

@RoutePage()
class DeactivateAccountPage extends StatelessWidget {
  const DeactivateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeactivateAccountPageScaffold();
  }
}
