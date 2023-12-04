import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/screens/RestaurantPage/RestaurantPage.dart';

class RestaurantView extends StatefulWidget {
  final Restaurants restaurant;

  const RestaurantView({super.key, required this.restaurant});

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF002b4a),
        title: const Center(
          child: Text(
            "Travelink",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Open Sans",
              fontVariations: [
                FontVariation('wght', 700),
              ],
            ),
            ),
        ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        color: const Color(0xFF3d627c),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.restaurant.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontFamily: "Nunito Sans",
                                  fontVariations: [
                                    FontVariation("wght", 600),
                                  ],
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  widget.restaurant.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 150.0,
                                  width: double.infinity,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RestaurantRating(rating: widget.restaurant.rating),
                                  RestaurantLikes(heart: widget.restaurant.heart),
                                  const Text(
                                    "Reviews", 
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: "Nunito Sans",
                                      fontVariations: [
                                        FontVariation('wght', 600),
                                      ],
                                  ),
                                  ),
                                  RestaurantDistance(distance: widget.restaurant.distance),
                                  RestaurantStyle(style: widget.restaurant.style),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RestaurantMenu(),
                                  SizedBox(width: 10.0),
                                  RestaurantBookTable(), 
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              RestaurantContactNumber(contactNumber: widget.restaurant.contactNumber),
                              RestaurantLocation(location: widget.restaurant.location),
                              const SizedBox(height: 10.0),
                              Center(
                                child: Container(
                                  height: 110.0,
                                  width: 350.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class RestaurantMenu extends StatelessWidget{
  const RestaurantMenu({Key? key}): super(key: key);

  @override 
  Widget build(BuildContext context){
    return Container(
      width: 90.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: GestureDetector(
        onTap: () => debugPrint("Menu Clicked"),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant, 
              size: 20.0,
              color: Color(0xFF002b4a)
              ),
            SizedBox(width: 5.0),
            Text(
              "Menu",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Nunito Sans",
                fontVariations: [
                  FontVariation('wght', 900),
                ],
              ),
              ),
          ],
        ),
      ),
      );
  }
}
class RestaurantBookTable extends StatelessWidget{
  const RestaurantBookTable({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Container(
      width: 170.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: GestureDetector(
        onTap: () => debugPrint("BookTable Clicked"),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline, 
              size: 20.0,
              color: Color(0xFF002b4a)
              ),
            SizedBox(width: 5.0),
            Text(
              "Book Table",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Nunito Sans",
                fontVariations: [
                  FontVariation('wght', 900),
                ],
              ),
              ),
          ],
        ),
      ),
      );
  }
}
class RestaurantContactNumber extends StatelessWidget{
  final String contactNumber;

  const RestaurantContactNumber({Key? key, required this.contactNumber}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: [
          const Icon(Icons.call, color: Colors.white, size: 25.0),
          const SizedBox(width: 10.0),
          Text(
            contactNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontFamily: "Nunito Sans",
              fontVariations: [
                FontVariation('wght', 600),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
class RestaurantLocation extends StatelessWidget{
  final String location;

  const RestaurantLocation({Key? key, required this.location}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.white, size: 25.0),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Nunito Sans",
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2, // You can set the maximum lines here
            ),
          ),
        ],
      ),
    );
  }
}
class RestaurantReviews extends StatelessWidget{
  final Restaurants restaurant;
  const RestaurantReviews({Key? key, required this.restaurant}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Row(
          children: [
            Icon(
              Icons.reviews_outlined, 
              size: 25.0,
              color: Colors.white,
              ),
            SizedBox(width: 5.0),
            Text(
              "asd",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: "Nunito Sans",
                fontVariations: [
                  FontVariation('wght', 700),
                ],
              ),
              ),
          ],
        ),
        Container(
          width: 350.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "asd",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9.5,
                    fontFamily: "Nunito Sans",
                    fontVariations: [
                      FontVariation("wght", 600),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}