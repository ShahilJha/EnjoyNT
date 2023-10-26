import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/privacy_policy_page_scaffold.dart';

@RoutePage()
class PrivacPolicyPage extends StatelessWidget {
  const PrivacPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrivacPolicyPageScaffold();
  }
}
