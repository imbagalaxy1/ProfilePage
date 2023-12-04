import 'package:flutter/material.dart';
import 'package:profile_page/screens/ProfilePage/ProfilePage.dart';



class TravelinkFlyoutDrawer extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Mark Lloyd Cuizon"),
            accountEmail: Text("marklloydcuizon@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "AB",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              // Handle home menu item
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Account"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Coupons and Rewards"),
            onTap: () {
              print("Coupons and Rewards");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CouponsAndRewardsPage()),
              // );
            },
          ),
      
          const Divider(), // Add a divider between main items and settings
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              // Handle settings menu item
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              print("Logout");
              // logout();
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (context) => LoginPage()),
              //       (Route<dynamic> route) => false,
              // );
            },
          ),
        ],
      ),
    );
  }

  // void logout() async{
  //   await GoogleOAuthApiService.logout();
  // }
}