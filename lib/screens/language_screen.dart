import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<String> allLanguages = [
    'English',
    'Chinese',
    'French',
    'German',
    'Greek',
    'Japanese',
    'Korean',
    'Spanish',
    'English',
    'Chinese',
    'French',
    'German',
    'Greek',
    'Japanese',
    'Korean',
    'Spanish',
    // Add more languages as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10.0,),
          const Text(
            "Language",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40.0),
          Expanded(
            child: ListView.builder(
              itemCount: allLanguages.length,
              itemBuilder: (context, index) {
                return _buildLanguage(allLanguages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguage(String language) {
    bool selected = false;
    return InkResponse(
      onTap: () {
        setState(() {
          selected = !selected;
          print("Tapped on $language");
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              language,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6597BC),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            const Divider(
              color: Color(0xFF87BCE3),
              height: 20,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}