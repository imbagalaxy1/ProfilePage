import 'package:flutter/material.dart';

class ZoomedImageScreen extends StatelessWidget {
  final String imageAsset;
  final String heroTag;

  ZoomedImageScreen({required this.imageAsset, required this.heroTag});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'zoomed_image', // Use the same tag as in the ProfilepageScreen
            child: Image.asset(
              imageAsset,
              fit: BoxFit.contain, // Fit the image to the screen
            ),
          ),
        ),
      ),
    );
  }
}
