import 'package:flutter/material.dart';
import 'package:pro_demo/models/leaderboard.dart';
import 'package:provider/provider.dart';
import 'package:pro_demo/widgets/leaderboard/leaderboard_tab.dart';
import 'package:pro_demo/providers/leaderboard_provider.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool _dataFetched = false;
  List<LeaderboardEntry> global = [];

  @override
  void initState() {
    super.initState();
    LeaderboardProvider leaderboardProvider =
        Provider.of<LeaderboardProvider>(context, listen: false);

    Future.delayed(Duration.zero).then((value) {
      leaderboardProvider.getGlobal().then((value) {
        setState(() {
          global = value.entries;
          _dataFetched = true;
        });
      });
    });
  }

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
        body: TabBarView(
          children: [
            // Global Leaderboard
            _dataFetched
                ? Center(
                    child: LeaderboardTab(
                      leaderboardData: global,
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),

            // Friends Leaderboard
            const Center(
              child: LeaderboardTab(
                leaderboardData: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
