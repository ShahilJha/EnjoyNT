import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'local_widgets/category_list_scafflod.dart';

@RoutePage()
class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryListScaffold();
  }
}
