import 'package:flutter/material.dart';
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
      appBar: AppBar( 
        backgroundColor: const Color(0xFF002b4a),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            "Edit Profile",
           style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
           ),
           ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            ),
          onPressed: () => Navigator.pop(context),
        ),
        ),
      body: ListView(
          children: [
          const SizedBox(height: 20.0),
          buildContainer("Set Display Name"),
          buildContainer("Please Select Country"),
          buildContainer("Please Select Birthday"),
          buildContainer("Please Select Gender"),
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
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
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
        const SizedBox(height: 5.0),
      ],
    );
}