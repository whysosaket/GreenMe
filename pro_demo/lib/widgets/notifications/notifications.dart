import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  void selectProfile(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.update_disabled_outlined,
            size: 150,
            color: Color.fromARGB(255, 58, 58, 58),
          ),
          Text(
            'No Notifications Yet!',
            style: TextStyle(
              fontSize: 17,
              color: Color.fromARGB(255, 58, 58, 58),
            ),
          ),
        ],
      ),
    );
  }
}
