import 'package:flutter/material.dart';
import 'package:profile_page/components/Profile_appbar.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  State<AccountInformationScreen> createState() => _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(title: "Profile"),
      body: Column(
        children: [
          const SizedBox(height: 10.0),
          Text('Account Information',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountInfoItem(label: 'Profile Photo', value: 'Your profile photo'),
                AccountInfoItem(label: 'Name', value: 'Mark Lloyd Cuizon'),
                AccountInfoItem(label: 'Username', value: 'YourUsername'),
                AccountInfoItem(label: 'Contact Info', value: 'Your contact info'),
                AccountInfoItem(label: 'ID Number', value: 'Your ID number'),
                AccountInfoItem(label: 'Membership ID', value: 'Your membership ID'),
                AccountInfoItem(label: 'Birthday', value: 'Your birthday'),
                AccountInfoItem(label: 'Country', value: 'Your country'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountInfoItem extends StatelessWidget {
  final String label;
  final String value;

  AccountInfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value),
    );
  }
}