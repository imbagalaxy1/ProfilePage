import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/NotificationPage.dart';

class profileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const profileAppBar({Key? key, required this.title}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return appbar(context);
  }
  
  AppBar appbar(BuildContext context){
    return AppBar(
      backgroundColor: const Color(0xFF002B4A),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontFamily: "Open Sans",
          fontVariations: [
            FontVariation('wght', 700)
          ]
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white,),
          onPressed: () {
            navigatesToNotificationPage(context);
          },
        ),
      ],
    );
  }
  void navigatesToNotificationPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));

  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}