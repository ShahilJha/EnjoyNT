import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widget/change_password_page_scaffold.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangePasswordPageScaffold();
  }
}
