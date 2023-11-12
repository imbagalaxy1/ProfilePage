import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';

class SampleScreen extends StatefulWidget{
  const SampleScreen({super.key});

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(title: "Profile"),
    );
  }
}