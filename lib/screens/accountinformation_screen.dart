import 'package:flutter/material.dart';
import 'package:profile_page/components/zoom_image_screen.dart';
import 'package:profile_page/components/bottom_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/screens/edit_profile_screen.dart';
class AccountInformationScreen extends StatefulWidget {
  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();

}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  bool _isCoverPhotoEditable = false;
  bool _isProfilePictureEditable = false;
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.idBadge,
    FontAwesomeIcons.userGroup,
    Icons.discount,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        appBar: const ProfileAppBar(),
        body: Column(

          children: [
            Text(
              "\nAccount Information",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      elevation: 3,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ZoomedImageScreen(
                                      imageAsset: "assets/images/cat_image.jpeg",
                                      heroTag: "cover_image",),
                              ));
                        },
                        child: Hero(
                          tag: 'cover_image',
                          child: Container(

                            height: 300,
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
                  bottom: 40.0,
                  left: 60.0,

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ZoomedImageScreen(
                                    imageAsset: "assets/images/cat_profile.jpeg",
                                    heroTag: "profile_image")
                            ,
                          ),);

                    },

                    child: SizedBox(
                      child: Hero(

                        tag: "profile_image",
                        child: Stack(
                            children: [
                        ClipRRect(
                        borderRadius: BorderRadius.circular(150.0),
                        child: Image.asset(
                          "assets/images/cat_profile.jpeg",
                          height: 120.0,
                          width: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    // Add your camera icon functionality here
                                  },
                                ),
                              ),
                            ],
                        ),
                      ),
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      // Add your camera icon functionality here
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  CustomListTile(
                    title: 'Name',
                    fieldValue: 'Farley Farlights', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  CustomListTile(
                    title: 'Username',
                    fieldValue: 'farlights', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  CustomListTile(
                    title: 'Contact Info',
                    fieldValue: 'farleyandthefarlights\n09182002183', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  CustomListTile(
                    title: 'ID Number or Membership ID',
                    fieldValue: '23-0918-002', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  CustomListTile(
                    title: 'Birthday',
                    fieldValue: 'September 12 2002', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  CustomListTile(
                    title: 'Country',
                    fieldValue: 'US', // Replace with your actual database record
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),


        bottomNavigationBar: TravelinkBottomNavigationBar(
            currentIndex: _selectedIndex = 1),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String fieldValue; // Add this field for the database record
  final VoidCallback onTap;

  const CustomListTile({
    required this.title,
    required this.fieldValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF002b4a),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // Add left padding
              child: Text(
                fieldValue,
                style: TextStyle(
                  color: Colors.grey, // Set the font color to gray
                ),
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}

