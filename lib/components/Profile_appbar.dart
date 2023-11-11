import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar( 
        backgroundColor: const Color(0xFF002b4a),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.0),
          child: Row(
            children: [
              Text(
              "Profile",
             style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
             ),
             ),
            ]
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          onPressed: () => Navigator.pop(context),
          ),
      );
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}