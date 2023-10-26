import 'package:flutter/material.dart';
import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(AppWidget());
}
