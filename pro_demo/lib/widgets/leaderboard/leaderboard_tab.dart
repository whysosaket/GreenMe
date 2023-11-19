import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/leaderboard/leaderboard_card.dart';

class LeaderboardTab extends StatelessWidget {
  final List<String> names;
  final List<String> profileImages;
  final List<int> scores;

  const LeaderboardTab({
    Key? key,
    required this.names,
    required this.profileImages,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: List.generate(names.length, (index) {
          return LeaderboardCard(
            name: names[index],
            profileImagePath: profileImages[index],
            score: scores[index],
          );
        }),
      ),
    );
  }
}
