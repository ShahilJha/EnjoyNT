import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/oragnaization_list_scafflod.dart';

@RoutePage()
class OraganizationListPage extends StatelessWidget {
  const OraganizationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrganizationListScaffold();
  }
}
