import 'package:flutter/material.dart';

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
                label: 'Translate'
            ),
          ]
      );
  }
}