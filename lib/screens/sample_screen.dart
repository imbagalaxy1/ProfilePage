import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget{
  const SampleScreen({super.key});

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            ),
        ],),
      ),
    );
  }
}