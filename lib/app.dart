import 'package:flutter/material.dart';
import 'package:iconcal/features/Splash/presentation/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Icon Cal",
      home: SplashPage(),
    );
  }
}
