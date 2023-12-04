import 'package:flutter/material.dart';
import 'package:profile_page/screens/ProfilePage/ProfilePage.dart';
import 'package:profile_page/screens/RestaurantPage/RestaurantPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primaryColor: const Color(0xFFfafafa),
        hintColor: const Color(0xFF002b4a),
        scaffoldBackgroundColor: const Color(0xFF336488),
      ),
      home: const ProfilePage(),
    );
  }
}