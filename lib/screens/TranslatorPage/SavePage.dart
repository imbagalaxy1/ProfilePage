import 'dart:ui';

import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: AppBar(
      backgroundColor: const Color(0xFF002B4A),
      centerTitle: true,
      title: const Text(
        "Saved",
        style: TextStyle(
          fontSize: 26,
          fontFamily: "Nunito Sans",
          fontVariations: [
            FontVariation('wght', 700)
          ]
        ),
      ),
    ),
      body: Container(),
    );
  }
}