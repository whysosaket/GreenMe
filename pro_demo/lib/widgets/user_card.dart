import 'package:flutter/material.dart';
import 'user_card_header.dart';
import 'user_card_stats.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 4,
      width: width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          UserCardHeader(),
          UserCardStats(),
        ],
      ),
    );
  }
}
