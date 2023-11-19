import 'package:flutter/material.dart';

class LeaderboardCard extends StatelessWidget {
  final String name;
  final String profileImagePath;
  final int score;

  const LeaderboardCard({
    Key? key,
    required this.name,
    required this.profileImagePath,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(profileImagePath),
        ),
        title: Text(name),
        subtitle: Text('Score: $score'),
      ),
    );
  }
}
