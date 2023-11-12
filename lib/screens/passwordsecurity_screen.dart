import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';
import 'package:profile_page/components/bottom_navigationbar.dart';

void main() {
  runApp(SecurityScreen());
}

class SecurityScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();

}

int _selectedIndex=0;
class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      bottomNavigationBar: TravelinkBottomNavigationBar(currentIndex: _selectedIndex = 1),
      backgroundColor: const Color(0xFF336488),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Password & Security",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            CustomListTile(
              title: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordScreen()),
                );

              },

            ),
            CustomListTile(
              title: 'Two-Factor authentication',
              onTap: () {
                // Navigate to Two-Factor authentication Screen
              },
            ),
            CustomListTile(
              title: 'Login Options',
              onTap: () {
                // Navigate to Login Options Screen
              },

            ),
            CustomListTile(
              title: 'Delete your data and account',
              onTap: () {
                // Navigate to Delete data Screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF002b4a),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password & Security'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your current password to change your password',
            ),
            SizedBox(height: 50),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Current Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update Password
              },
              child: Text('Update Password'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
