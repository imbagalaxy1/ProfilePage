import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/profile_appbar.dart';
import 'package:profile_page/components/travelink_rounded_entry.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: const profileAppBar(title: "Edit Profile"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
                children: [
                const SizedBox(height: 20.0),
                buildContainer("Set Display Name"),
                buildContainer("Please Select Country"),
                buildContainer("Please Select Birthday"),
                buildContainer("Please Select Gender"),
              ],
            ),
          ),
          Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Button's functionality here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF002b4a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
            ),
            child: const Text(
              'Proceed',
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: "Nunito Sans",
                fontVariations: [
                  FontVariation('wght', 700),
                ],
              ),
              ),
          ),
        ),
        ],
      ), 
    );
  }
}
Widget buildContainer(String labelText) {
  return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontFamily: "Open Sans",
                   )
                ),
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 40.0,
            child: TravelinkRoundedTextField(),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
}