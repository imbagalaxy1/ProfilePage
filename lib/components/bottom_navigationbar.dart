import 'package:flutter/material.dart';
import 'package:profile_page/screens/ProfilePage/ProfilePage.dart';
import 'package:profile_page/screens/RestaurantPage/RestaurantPage.dart';
import 'package:profile_page/screens/TranslatorPage/TranslatorPage.dart';

class TravelinkBottomNavigationBar extends StatelessWidget{
  final int currentIndex;
  const TravelinkBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: const Color(0xFF002B4A),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Discover'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                label: 'Planner'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on),
                label: 'Budget'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.translate),
                label: 'Translate',
            ),
          ],
          onTap: (index) {
        // Use Navigator to navigate to the selected screen
        switch (index) {
          case 0:
            print("Discover clicked");
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RestaurantPage()));
            break;
          case 3:
            print("Budget clicked");// Replace with correct route
            break;
          case 4:
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TranslatorPage()));            
            break;
        }
      },
      );
  }
}