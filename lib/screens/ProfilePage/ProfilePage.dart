import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/components/bottom_navigationbar.dart';
import 'package:profile_page/components/travelink_flyout_drawer.dart';
import 'package:profile_page/screens/ProfilePage/AccountInfoPage.dart';
import 'package:profile_page/screens/ProfilePage/HealthRecordsPage.dart';
import 'package:profile_page/screens/ProfilePage/HelpCenterPage.dart';
import 'package:profile_page/screens/ProfilePage/LanguagePage.dart';
import 'package:profile_page/screens/ProfilePage/PassSecurityPage.dart';
import 'package:profile_page/screens/ProfilePage/SampleScreen.dart';
import 'package:profile_page/screens/ProfilePage/TravelHistoryPage.dart';
import 'package:profile_page/screens/ProfilePage/ZoomedImage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    Icons.badge,
    Icons.group,
    Icons.discount,
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SamplePage()
              ),
          );
        });
      },
      child: Column(
        children: [
           Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: _selectedIndex == index 
            ? const Color(0xFFE7EBEE) 
            : const Color(0xFF002b4a),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              _icons[index],
              size: 60.0,
              color: _selectedIndex == index 
              ? const Color(0xFF336488)
              : const Color(0xFFfafafa),
              ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
            _getLabel(index),
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: "Nunito Sans",
                fontVariations: [
                  FontVariation('wght', 700)
                ]
            ),
         )
        ],
      ),

    );
  }
  String _getLabel(int index) {
    List<String> labels = [
      "Badges",   // Corresponding to Icons.badge
      "Friends",  // Corresponding to Icons.group
      "Coupons",  // Corresponding to Icons.discount
    ];

    if (index >= 0 && index < labels.length) {
      return labels[index];
    }

    return "Default Label";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF336488),
        appBar: const profileAppBar(title: "Profile"),
        body: Column(
          children: [
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
                              builder: (context) => ZoomedImage(imageAsset: "assets/images/cat_image.jpeg", heroTag: "cover_image",),
                            ));
                          },
                          child: Hero(
                            tag: 'cover_image',
                            child: Container(
                              height: 190,
                              width: double.infinity,
                              color: Colors.grey,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/cat_image.jpeg",
                                  height: 300.0,
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
                              builder: (context) => ZoomedImage(imageAsset: "assets/images/cat_profile.jpeg", heroTag: "profile_image"),
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
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Farley Farlights",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      letterSpacing: 1.0,
                      fontFamily: "Nunito Sans",
                      fontVariations: [
                        FontVariation('wght', 700)
                      ]
                    ),
                  ),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white, 
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your logout action here
                        debugPrint("Logout");
                      },
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontFamily: "Nunito Sans",
                          fontVariations: [
                            FontVariation('wght', 700)
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 15.0),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "@farlights",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: "Nunito Sans",
                      fontVariations: [
                        FontVariation('wght', 700)
                      ]
                    ),
                  ),
                ],
              ),
           ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: 
              _icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => _buildIcon(map.key),
              )
              .toList(),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileInfoItem(title: "Account Information", icon: Icons.person_outline_rounded, top: const Radius.circular(20.0), bottom: Radius.zero),
                        ProfileInfoItem(title: "Password & Security", icon: Icons.security, top: Radius.zero, bottom: const Radius.circular(20.0)),
                        const SizedBox(height: 10.0),
                        ProfileInfoItem(title:  "Health Records", icon: Icons.local_hospital_outlined, top: const Radius.circular(20.0), bottom: Radius.zero),
                        ProfileInfoItem(title:  "Travel History", icon: Icons.travel_explore, top: Radius.zero, bottom: const Radius.circular(20.0)),
                        const SizedBox(height: 10.0),
                        ProfileInfoItem(title:  "Language", icon: Icons.language, top: const Radius.circular(20.0), bottom: Radius.zero),
                        ProfileInfoItem(title:  "Help Center", icon: Icons.help_outline_outlined, top: Radius.zero, bottom: const Radius.circular(20.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: TravelinkBottomNavigationBar(currentIndex: _selectedIndex = 1),
        drawer: TravelinkFlyoutDrawer(),
      ),
    );
  }
}

class ProfileInfoItem extends StatelessWidget{
  final String title;
  final IconData icon;
  final Radius top, bottom;

  ProfileInfoItem({required this.title, required this.icon, required this.top, required this.bottom});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _handleItemClick(context, title);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: top, bottom: bottom),
              color: const Color(0xFF002b4a),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 26.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Nunito Sans",
                      fontVariations: [
                        FontVariation('wght', 700)
                      ]
                    ),
                  ),
                  const Spacer(),
                  const IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 24.0,
                      color: Colors.grey,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 1.0),
        ],
      ),
    );
  }
}
void _handleItemClick(BuildContext context, String title) {
  // Perform navigation based on the clicked item's title
  switch (title) {
    case "Account Information":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountInformationPage()),
      );
      break;
    case "Password & Security":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecurityPage()),
      );
      break;
    case "Health Records":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HealthRecordPage()),
      );
      break;
    case "Travel History":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TravelHistoryPage()),
      );
      break;
    case "Language":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LanguagePage()),
      );
      break;
    case "Help Center":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HelpCenterPage()),
      );
      break;
    // Add more cases for other items as needed
  }
}

