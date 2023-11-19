import 'package:flutter/material.dart';
import 'package:pro_demo/widgets/leaderboard/leaderboard_tab.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: const TabBarView(
          children: [
            // Global Leaderboard
            Center(
              child: LeaderboardTab(
                names: [
                  'John Doe',
                  'Jane Doe',
                  'Alice',
                ],
                profileImages: [
                  'assets/images/user.jpeg',
                  'assets/images/user.jpeg',
                  'assets/images/user.jpeg',
                ],
                scores: [250, 200, 150],
              ),
            ),

            // Friends Leaderboard
            Center(
              child: LeaderboardTab(
                names: [
                  'Friend 1',
                  'Friend 2',
                  'Friend 3',
                ],
                profileImages: [
                  'assets/images/user.jpeg',
                  'assets/images/user.jpeg',
                  'assets/images/user.jpeg',
                ],
                scores: [180, 160, 140],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
