import 'package:flutter/material.dart';
import 'package:pro_demo/models/leaderboard.dart';
import 'package:provider/provider.dart';
import 'package:pro_demo/widgets/leaderboard/leaderboard_tab.dart';
import 'package:pro_demo/providers/leaderboard_provider.dart';

// const List<LeaderboardEntry> _leaderboardData = [
//   LeaderboardEntry(
//     name: 'Friend 1',
//     score: 180,
//   ),
//   LeaderboardEntry(
//     name: 'Friend 2',
//     score: 160,
//   ),
//   LeaderboardEntry(
//     name: 'Friend 3',
//     score: 140,
//   ),
// ];

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool _dataFetched = false; // Flag to track whether data has been fetched

  @override
  Widget build(BuildContext context) {
    LeaderboardProvider? leaderboardProvider =
        Provider.of<LeaderboardProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 255, 232),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Global',
              ),
              Tab(
                text: 'Friends',
              ),
            ],
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        body: TabBarView(
          children: [
            // Global Leaderboard
            FutureBuilder<Leaderboard>(
              future: _dataFetched ? null : leaderboardProvider.getGlobal(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  print(snapshot.data);
                  // No need to cast snapshot.data to List<Map<String, dynamic>>
                  return const Center(
                    child: LeaderboardTab(
                      leaderboardData: [],
                    ),
                  );
                }
              },
            ),

            // Friends Leaderboard
            const Center(
              child: LeaderboardTab(
                leaderboardData: [
                  {
                    'name': 'Friend 1',
                    'profileImage': 'assets/images/user.jpeg',
                    'score': 180
                  },
                  {
                    'name': 'Friend 2',
                    'profileImage': 'assets/images/user.jpeg',
                    'score': 160
                  },
                  {
                    'name': 'Friend 3',
                    'profileImage': 'assets/images/user.jpeg',
                    'score': 140
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
