import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/components/travelink_rounded_entry.dart';
import 'package:profile_page/screens/ProfilePage/models/articles_model.dart';
import 'package:profile_page/screens/ProfilePage/models/faqs_model.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const profileAppBar(title: "Profile"),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              color: const Color(0xFF336488),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'Help Center',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Nunito Sans",
                      fontVariations: [
                        FontVariation('wght', 700)
                      ]
                    ),
                  ),
                  _searchWidget(),
                ],
                ),
            ),
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _tutorialWidget(),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Frequently Asked Questions",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontFamily: "Nunito Sans",
                        fontVariations: [
                          FontVariation('wght', 600)
                        ],
                      ),
                      ),
                    GestureDetector(
                      onTap: () => debugPrint("View all clicked"),
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Nunito Sans",
                          fontVariations: [
                            FontVariation('wght', 600)
                          ],
                        ),
                        ),
                    ),
                  ],
                ),
                _faqsWidget(),
                const SizedBox(height: 5.0),
                const Row(
                  children: [
                    Text(
                      "Top Articles",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        fontFamily: "Nunito Sans",
                        fontVariations: [
                          FontVariation('wght', 600)
                        ],
                      ),
                      ),
                  ],
                ),
                _articlesWidget(),
              ],
            ),
          ),
          ],
        ),
      ),
      );
  }
}

Widget _searchWidget(){
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 180.0,
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/images/Searchbg.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 30.0,
        child: SizedBox(
          height: 40.0,
          width: 350.0,
          child: Stack(
            children: [
              TravelinkRoundedTextField(),
              Positioned(
                right: 5.0,
                child: GestureDetector(
                  onTap: () => debugPrint("Search Icon Clicked"),
                  child: const Icon(
                    Icons.search,
                    size: 40.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
            ),
      ),
    ],
  );
}
Widget _tutorialWidget(){
  return Column(
    children: [
      const Row(
        children: [
          Text(
            "Tutorials",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1.0,
              fontFamily: "Nunito Sans", 
              fontVariations: [
                FontVariation('wght', 600),
              ],
            ),
            ),
        ],
      ),
      SizedBox(
        height: 70.0,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/Tutorial.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
Widget _faqsWidget(){
  return SizedBox(
    height: 170.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: faqs.length,
      itemBuilder: (BuildContext context, int index){
        FAQS Faqs = faqs[index];
        return GestureDetector(
          onTap: () => debugPrint("Clicked"),
          child: Row(
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xFFd0d1d2),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 120.0,
                      height: 140.0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20.0),
                          bottom: Radius.zero,
                        ),
                        child: Image.asset(
                          Faqs.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      Faqs.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Nunito Sans",
                        fontVariations: [
                          FontVariation('wght', 900)
                        ],
                        overflow: TextOverflow.ellipsis
                      ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        );
      },
    ),
  );
}
Widget _articlesWidget(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: articles.map((article) {
      return GestureDetector(
        onTap: () => debugPrint("Clicked"),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              article.imageUrl,
              fit: BoxFit.cover,
              height: 100.0,
              width: double.infinity,
            ),
          ),
        ),
      );
    }).toList(),
  );
}

