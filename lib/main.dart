import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'injection.dart';
import 'presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD6idmppXISrgq1aoWj88I-B_J7Brnyxx4",
      appId: "1:208450225674:android:e30c0b4e71829489ea81f3",
      messagingSenderId: "XXX",
      projectId: "enjoynt-5d8a4",
    ),
  );
  await configureDependencies();
  runApp(AppWidget());
}
