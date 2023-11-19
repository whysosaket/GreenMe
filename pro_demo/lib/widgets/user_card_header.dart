import 'package:flutter/material.dart';

class UserCardHeader extends StatelessWidget {
  const UserCardHeader();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height / 8,
      width: width / 1.1,
      child: const ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 237, 255, 220),
          radius: 30,
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        title: Text(
          'Rohit Kumar',
          style: TextStyle(
            color: Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'rohitkumar11@gmail.com',
          style: TextStyle(
            color: Color.fromARGB(255, 34, 34, 34),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 237, 255, 220),
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 34, 34, 34),
            ),
          ),
        ),
      ),
    );
  }
}
