import 'package:flutter/material.dart';
import 'package:navigation_app/about_page.dart';
import 'package:navigation_app/home_page.dart';
import 'package:navigation_app/notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home_page": (context) => const HomePage(),
        "/notifications_page": (context) => const Notifications(),
        "/about_page": (context) => const AboutPage(),
      },
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
