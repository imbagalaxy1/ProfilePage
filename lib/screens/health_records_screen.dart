import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/models/travel_history_model.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  State<HealthRecordScreen> createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: const ProfileAppBar(title: "Profile"),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
            children: [
              const SizedBox(height: 10.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Health Records",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Nunito Sans",
                      fontVariations: [
                        FontVariation('wght', 700),
                      ]
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFF002b4a),
                  ),
                  child: Column(
                      children: [
                        for (var recordData in healthRecordsData)
                          _buildContainer(recordData),
                      ],
                    ),
                ),
              ),
              
            ],
      ),
          ],
        ),
      )
    );
  }
}

Widget _buildContainer(HealthRecordsData data){
  return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Nunito Sans",
                          fontVariations: [
                            FontVariation('wght', 900),
                          ]
                          ),
                        ),
                        const Divider(
                          color: Color(0xFF336488),
                          height: 20,
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            data.description,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Nunito Sans",
                              fontVariations: [
                                FontVariation('wght', 900),
                              ]
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 9,
                          ),
                        ),
                    ]
                    ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
}