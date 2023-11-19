import 'package:flutter/material.dart';
import 'package:pro_demo/models/leaderboard.dart';
import 'package:pro_demo/widgets/leaderboard/leaderboard_card.dart';

class LeaderboardTab extends StatelessWidget {
  final List<LeaderboardEntry> leaderboardData;

  const LeaderboardTab({
    Key? key,
    required this.leaderboardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: List.generate(leaderboardData.length, (index) {
          final data = leaderboardData[index];
          print("ssssasdasda");
          return LeaderboardCard(
            name: data.name,
            profileImagePath: "assets/images/user.jpeg",
            score: data.score,
          );
        }),
      ),
    );
  }
}
