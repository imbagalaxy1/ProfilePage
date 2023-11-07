import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_page/bottom_navigationbar.dart';
import 'package:profile_page/screens/sample_screen.dart';
import 'package:profile_page/widgets/zoom_image_screen.dart';

class ProfilepageScreen extends StatefulWidget {
  const ProfilepageScreen({super.key});

  @override
  State<ProfilepageScreen> createState() => _ProfilepageScreenState();
}

class _ProfilepageScreenState extends State<ProfilepageScreen> {
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.idBadge,
    FontAwesomeIcons.userGroup,
    Icons.discount,
  ];

  
final List<Map<String, dynamic>> itemList = [
  {"title": "Account Information", "icon": Icons.person_outline_rounded},
  {"title": "Password & Security", "icon": Icons.security},
  {"title": "Health Records", "icon": Icons.local_hospital_outlined},
  {"title": "Travel History", "icon": Icons.travel_explore},
  {"title": "Language", "icon": Icons.language},
  {"title": "Help Center", "icon": Icons.help_outline_outlined},
  // Add more items as needed
  ];

  String _getLabel(int index) {
    List<String> labels = [
      "Badges",   // Corresponding to FontAwesomeIcons.idBadge
      "Friends",  // Corresponding to FontAwesomeIcons.userGroup
      "Coupons",  // Corresponding to Icons.discount
    ];

    if (index >= 0 && index < labels.length) {
      return labels[index];
    }

    return "Default Label";
  }

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index; // jenver
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SampleScreen()
              ),
          );
        });
      },
      child: Column(
        children: [
           Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: _selectedIndex == index 
            ? const Color(0xFFE7EBEE) 
            :Theme.of(context).hintColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: 30.0,
            color: _selectedIndex == index 
            ? const Color(0xFF336488)
            : Theme.of(context).primaryColor,
            ),
        ),
        const SizedBox(height: 5.0),
        Text(
            _getLabel(index),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
         )
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF002b4a),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    offset: Offset(0, 4), // Shadow offset
                    blurRadius: 4, // Shadow blur radius
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, size: 40.0),
                      color: Colors.white,
                      onPressed: () {
                        // Add your menu button action here
                      },
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications, size: 35.0),
                      color: Colors.white,
                      onPressed: () {
                        // Add your notification button action here
                      },
                    ),
                  ],
                ),
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
                              height: 250,
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
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white, // Background color of the button
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your logout action here
                        debugPrint("Logout");
                      },
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Text color of the button
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
                    "@JohnD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
           ),
            const SizedBox(height: 20),
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
                  //color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: itemList.map((item) {
                        return _buildListItem(
                          item["title"],
                          item["icon"],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: TravelinkBottomNavigationBar(currentIndex: _selectedIndex = 1),
      ),
    );
  }
}
Widget _buildListItem(String title, IconData icon) {
  return InkWell(
    onTap: () => print("Clicked"),
    customBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0) ), // handle event here
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF002b4a),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
            const SizedBox(width: 10.0), // Icon before the text
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ), // Text
            const Spacer(), // Spacer to push the arrow button to the right
            const IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 25.0,
                color: Colors.grey,
              ),
              onPressed: null,
            ), // Arrow button at the end
          ],
        ),
      ),
    ),
  );
}

