import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/screens/RestaurantPage/RestaurantViewPage.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                SizedBox(height: 20.0),
                Container(
                  width: 300.0,
                  child: const Text(
                    "Nearby Restaurant of Olango Island Wildlife Sanctuary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "Nunito Sans",
                      fontStyle: FontStyle.italic, 
                      fontVariations: [
                        FontVariation("wght", 700)
                      ],
                    ),
                    ),
                ),
                const SizedBox(height: 10.0),
                const RestaurantList(),
              ],
            ),
          ),
    );
  }
}

class RestaurantList extends StatelessWidget{
  const RestaurantList({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (BuildContext context, int index){
          Restaurants restaurant = restaurants[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestaurantView(restaurant: restaurant))
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                color: const Color(0xFF3d627c),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        restaurant.imageUrl,
                        fit: BoxFit.cover,
                        height: 120.0,
                        width: 170.0,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    child: Container(
                      width: 170.0,
                      height: 120.0,
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          RestaurantName(name: restaurant.name),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestaurantRating(rating: restaurant.rating),
                              RestaurantLikes(heart: restaurant.heart),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestaurantDistance(distance: restaurant.distance),
                              RestaurantStyle(style: restaurant.style),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          RestaurantPrice(price: restaurant.price),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class RestaurantName extends StatelessWidget{
  final String name;

  const RestaurantName({Key? key, required this.name}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: "Nunito Sans",
        fontStyle: FontStyle.italic, 
        fontVariations: [
          FontVariation("wght", 800)
        ],
        letterSpacing: 1.0,
        overflow: TextOverflow.ellipsis,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white70,
        decorationThickness: 2,
      ),
    );
  }
}
class RestaurantRating extends StatelessWidget{
  final double rating;

  const RestaurantRating({Key? key, required this.rating}): super(key: key);
  @override
  Widget build(BuildContext context){
  return Container(
    width: 80.0,
    height: 22.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.star, 
          size: 20.0,
          color: Color(0xFF002b4a)
          ),
        Text(
          "$rating/5.0",
          style: const TextStyle(
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
class RestaurantLikes extends StatelessWidget{
  final String heart;

  const RestaurantLikes({Key? key, required this.heart}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        const Icon(
          Icons.favorite, 
          size: 20.0,
          color: Colors.white,
          ),
          const SizedBox(width: 3.0,),
          Text(
            heart,
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
    );
  }
}
class RestaurantDistance extends StatelessWidget{
  final double distance;

  const RestaurantDistance({Key? key, required this.distance}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.white,),
        Text(
          "${distance}km",
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
    );
  }
}
class RestaurantStyle extends StatelessWidget{
  final String style;

  const RestaurantStyle({Key? key, required this.style}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: 70.0,
      height: 25.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          style,
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
    );
  }
}
class RestaurantPrice extends StatelessWidget{
  final int price;

  const RestaurantPrice({Key? key, required this.price}): super(key: key);
  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        "US\$$price",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontFamily: "Nunito Sans",
          fontVariations: [
            FontVariation("wght", 700),
          ],
          decoration: TextDecoration.underline,
          decorationColor: Colors.white70,
          decorationThickness: 2, 
        ),
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
              "Reviews",
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
class Restaurants{
  String imageUrl;
  String name;
  String heart;
  String style;
  String contactNumber;
  String location;
  int price;
  double distance;
  double rating;
  List<Reviews> reviews;

  Restaurants({
    required this.imageUrl,
    required this.name,
    required this.heart,
    required this.style,
    required this.contactNumber,
    required this.location,
    required this.price,
    required this.distance,
    required this.rating,
    required this.reviews,
  });
}
class Reviews{
  String imageUrl;
  String comment;

  Reviews({
    required this.imageUrl,
    required this.comment,
  });
}
List<Restaurants> restaurants = [
  Restaurants(
    imageUrl: 'assets/images/Restaurant.jpg',
    name: 'ABACA RESTAURANT',
    heart: '23k+',
    distance: 9.41,
    style: 'Western-Style',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 4.7,
    reviews: reviews,
  ),
  Restaurants(
    imageUrl: 'assets/images/Transport.jpg',
    name: 'TIDES',
    heart: '23k+',
    distance: 8.77,
    style: 'Buffets',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 3.0,
    reviews: reviews,
  ),
  Restaurants(
    imageUrl: 'assets/images/Hotel.jpg',
    name: 'STEAK HOUSE WESTERN',
    heart: '23k+',
    distance: 7.09,
    style: 'Western-style',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 5.0,
    reviews: reviews,
  ),
  Restaurants(
    imageUrl: 'assets/images/Hotel.jpg',
    name: 'MARIBAGO GRILL CEBU',
    heart: '23k+',
    distance: 7.24,
    style: 'Southeast Asian',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 3.2,
    reviews: reviews,
  ),
  Restaurants(
    imageUrl: 'assets/images/Restaurant.jpg',
    name: 'FUI RESTAURANT',
    heart: '23k+',
    distance: 5.66,
    style: 'Asian Cuisine',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 4.8,
    reviews: reviews,
  ),
  Restaurants(
    imageUrl: 'assets/images/Transport.jpg',
    name: 'FUI RESTAURANT',
    heart: '23k+',
    distance: 5.66,
    style: 'Asian Cuisine',
    contactNumber: "+63-32-4953461",
    location: "Punta Engano Road, Mactan Island, Lapu Lapu City 6015",
    price: 64,
    rating: 4.8,
    reviews: reviews,
  ),
];

List<Reviews> reviews = [
  Reviews(
    imageUrl: 'assets/images/Pasta.jpg',
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  ),
  Reviews(
    imageUrl: 'assets/images/Burger.jpg',
    comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  ),
];