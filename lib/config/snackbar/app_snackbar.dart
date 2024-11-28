import 'package:flutter/material.dart';

class SnackBarService {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static SnackBar showCustomSnackBar(String message,
      {Color backgroundColor = Colors.deepOrange,
      Duration duration = const Duration(seconds: 4)}) {
    if (scaffoldMessengerKey.currentState?.context == null) {
      throw Exception(
          'ScaffoldMessengerKey not properly initialized with a context.');
    }

    return SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      width: scaffoldMessengerKey.currentState!.context.size!.width * 0.85,
      duration: duration,
    );
  }

  static void show(String message,
      {Color backgroundColor = Colors.deepOrange}) {
    scaffoldMessengerKey.currentState!.clearSnackBars();

    final snackBar =
        showCustomSnackBar(message, backgroundColor: backgroundColor);
    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }
}
