import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/notifications/notifications.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Sample notification messages
  final List<String> sampleNotifications = [
    'You have a new follower!',
    'Someone liked your post.',
    'Your contribution has been approved.',
    'New event notification.',
    'Check out the latest updates!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 243, 255, 232),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 255, 232),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 243, 255, 232),
        ),
        child: Column(
          children: [
            Expanded(
              child: Notifications(
                notificationMessages: sampleNotifications,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
