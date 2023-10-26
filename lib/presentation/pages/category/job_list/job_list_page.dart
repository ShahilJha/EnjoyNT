import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/job_list_scafflod.dart';

@RoutePage()
class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return JobListScaffold();
  }
}
