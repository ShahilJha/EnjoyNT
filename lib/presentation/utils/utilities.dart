import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../core/app_widget.dart';

class Utilities {
  Future showSnackBar({required String text}) async {
    return kScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(text),
      ),
    );
  }

  void removeHistoryAndPop(BuildContext context) {
    Router.neglect(
      context,
      () {
        context.router.removeLast();
      },
    );
  }
}
