import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/components/bottom_navigationbar.dart';

class TravelHistoryScreen extends StatefulWidget {
  const TravelHistoryScreen({super.key});

  @override
  State<TravelHistoryScreen> createState() => _TravelHistoryScreenState();
}

class _TravelHistoryScreenState extends State<TravelHistoryScreen> {
  @override
  int _selectedIndex =0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(title: "Profile"),
      bottomNavigationBar: TravelinkBottomNavigationBar(currentIndex: _selectedIndex = 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Center(
              child: Text(
                "Travel History",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            // Database Entries
            _buildDatabaseEntry('City A', 'Hotel A', '2023-01-01'),
            _buildDatabaseEntry('City B', 'Hotel B', '2023-02-15'), //sample
            // Insert records from database here
          ],
        ),
      ),
    );
  }

  // column labels
  Widget _buildLabel(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // data from database output
  Widget _buildDatabaseEntry(String place, String hotel, String date) {
    return Container(
      margin: EdgeInsets.only(top: 8.0), // Adjusted margin to align with labels
      padding: EdgeInsets.all(16.0),
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