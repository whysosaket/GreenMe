import 'package:flutter/material.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:pro_demo/screens/notifications_screen.dart';
import 'package:provider/provider.dart';

class UserCardHeader extends StatefulWidget {
  const UserCardHeader({super.key});

  @override
  State<UserCardHeader> createState() => _UserCardHeaderState();
}

class _UserCardHeaderState extends State<UserCardHeader> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      // user = Provider.of<UserProvider>(context).user;
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    User? user = Provider.of<UserProvider>(context).user;
    return SizedBox(
      height: height / 8,
      width: width / 1.1,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 237, 255, 220),
          radius: 30,
          backgroundImage: AssetImage('assets/images/user.jpeg'),
          // AssetImage(user?.avatar ?? 'assets/images/user.jpeg'),
        ),
        title: Text(
          user?.name ?? 'Unknown',
          style: const TextStyle(
            color: Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          user?.email ?? 'Not Found',
          style: const TextStyle(
            color: Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 237, 255, 220),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationsScreen()));
            },
            icon: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 34, 34, 34),
            ),
          ),
        ),
      ),
    );
  }
}
