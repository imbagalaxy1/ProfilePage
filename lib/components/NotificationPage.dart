import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF002B4A),
        title: const Text('Notifications'),
      ),
      body: NotificationList(),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your actual notification data source.
    List<NotificationItem> notifications = [
      NotificationItem(
        title: 'Flight Update',
        message: 'Your flight to Paris has been delayed by 1 hour.',
        timestamp: '2 hours ago',
      ),
      NotificationItem(
        title: 'Hotel Check-In',
        message: 'Check-in time at your hotel is at 3 PM.',
        timestamp: 'Yesterday',
      ),
      // Add more notifications here
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(notification: notifications[index]);
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;

  NotificationItem({required this.title, required this.message, required this.timestamp});
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.notifications),
        title: Text(notification.title),
        subtitle: Text(notification.message),
        trailing: Text(notification.timestamp),
        onTap: () {
          // Handle notification tap here
        },
      ),
    );
  }
}
