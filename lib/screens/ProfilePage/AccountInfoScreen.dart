import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/profile_appbar.dart';
import 'package:profile_page/components/zoom_image_screen.dart';
import 'package:profile_page/screens/edit_profile_screen.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  State<AccountInformationScreen> createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: const profileAppBar(title: "Profile"),
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          const Text('Account Information',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: "Nunito Sans",
              fontVariations: [
                FontVariation('wght', 700),
              ]
            ),
          ),
          Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoomedImageScreen(imageAsset: "assets/images/cat_image.jpeg", heroTag: "cover_image",),
                            ));
                          },
                          child: Hero(
                            tag: 'cover_image',
                            child: Container(
                              color: Colors.grey,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/cat_image.jpeg",
                                  height: 190,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 25.0,
                    child: GestureDetector(
                      onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoomedImageScreen(imageAsset: "assets/images/cat_profile.jpeg", heroTag: "profile_image"),
                            ));
                          },
                      child: SizedBox(
                        child: Hero(
                          tag: "profile_image",
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            "assets/images/cat_profile.jpeg",
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                            ),
                        ),
                      ),
                    ),
                  ),
                  _buildCamera(20.0, 100.0, "profile"),
                  _buildCamera(20.0, 350.0, "cover"),
                ],
              ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                children: [
                  AccountInfoItem(label: 'Profile Photo', value: 'Your profile photo'),
                  AccountInfoItem(label: 'Name', value: 'Mark Lloyd Cuizon'),
                  AccountInfoItem(label: 'Username', value: 'YourUsername'),
                  AccountInfoItem(label: 'Contact Info', value: 'Your contact info'),
                  AccountInfoItem(label: 'ID Number', value: 'Your ID number'),
                  AccountInfoItem(label: 'Membership ID', value: 'Your membership ID'),
                  AccountInfoItem(label: 'Birthday', value: 'Your birthday'),
                  AccountInfoItem(label: 'Country', value: 'Your country'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  void _handleCameraClick(String action) {
    if (action == "profile") {
      // Handle profile image change logic
      print("Change profile image");
    } else if (action == "cover") {
      // Handle cover image change logic
      print("Change cover image");
    }
  }

Widget _buildCamera(double bottomPosition, double leftPosition, String action){
  return Positioned(
                    bottom: bottomPosition,
                    left: leftPosition,
                    child: GestureDetector(
                      onTap: () {
                        _handleCameraClick(action);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:Color(0xFF002b4a),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  );
}
class AccountInfoItem extends StatelessWidget {
  final String label;
  final String value;

  AccountInfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF002b4a), // Set your desired background color
      ),
      child: ListTile(
        title: Text(label, 
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontFamily: "Nunito Sans",
            fontVariations: [
              FontVariation('wght', 800),
            ],
          ),
        ),
        subtitle: Text(value, 
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white54,
            fontFamily: "Nunito Sans",
            fontVariations: [
              FontVariation('wght', 700),
            ]
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
        ),
        onTap: () => 
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => const EditProfileScreen()
            )
            ),
      ),
    );
  }
}