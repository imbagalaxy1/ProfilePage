import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/screens/TranslatorPage/SavePage.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: AppBar(
      backgroundColor: const Color(0xFF002B4A),
      centerTitle: true,
      title: const Text(
        "Translator",
        style: TextStyle(
          fontSize: 26,
          fontFamily: "Nunito Sans",
          fontVariations: [
            FontVariation('wght', 700)
          ]
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.star),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const SavePage()));
          },
        ),
      ],
    ),
      body: Container(),
    );
  }
}