import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> _editProfile = [
    "Set Display Name",
    "Please Select Country",
    "Please Select Birthday",
    "Please Select Gender",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Theme.of(context).hintColor,
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
        leading: const Icon(Icons.arrow_back_ios),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 180.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Set Display Name",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Please Select a Country",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
      ),
    );
  }
}