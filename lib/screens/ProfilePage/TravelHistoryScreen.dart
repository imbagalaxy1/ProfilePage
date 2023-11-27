import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile_page/components/profile_appbar.dart';

class TravelHistoryScreen extends StatefulWidget {
  const TravelHistoryScreen({super.key});

  @override
  State<TravelHistoryScreen> createState() => _TravelHistoryScreenState();
}

class _TravelHistoryScreenState extends State<TravelHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF336488),
      appBar: const profileAppBar(title: "Profile"),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              const Text(
                "Travel History",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: "Nunito Sans",
                  fontVariations: [
                    FontVariation('wght', 700),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        child: _buildLabel('Place'),
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        child: _buildLabel('Hotel'),
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        child: _buildLabel('Date'),
                        alignment: Alignment.center,
                      ),
                    ),
              
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 700.0,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
              // Database Entries
              //_buildDatabaseEntry('City A', 'Hotel A', '2023-01-01'),
              //_buildDatabaseEntry('City B', 'Hotel B', '2023-02-15'), //sample
              // Insert records from database here
            ],
          ),
        ],
      ),
    );
  }

  // column labels
  Widget _buildLabel(String text) {
    return Container(
      width: 120.0,
      height: 30.0,
      //padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14.0,
            fontFamily: "Nunito Sans",
            fontVariations: [
              FontVariation('wght', 900),
            ]
          ),
        ),
      ),
    );
  }

  // data from database output
  Widget _buildDatabaseEntry(String place, String hotel, String date) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0), // Adjusted margin to align with labels
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              place,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              hotel,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              date,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}