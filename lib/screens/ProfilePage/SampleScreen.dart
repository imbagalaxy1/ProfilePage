import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';

class SamplePage extends StatefulWidget{
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const profileAppBar(title: "Profile"),
    );
  }
}