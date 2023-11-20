import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pro_demo/models/score.dart';
import 'package:pro_demo/models/user.dart';
import 'package:pro_demo/providers/score_provider.dart';
import 'package:pro_demo/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCardStats extends StatefulWidget {
  const UserCardStats();

  @override
  State<UserCardStats> createState() => _UserCardStatsState();
}

class _UserCardStatsState extends State<UserCardStats> {
  String score = "0";
  // final double factor = Random().nextDouble() / 5;
  final double factor = 0.13;

  @override
  void initState() {
    super.initState();
    _fetchScore();
  }

  Future<void> _fetchScore() async {
    try {
      final value = await ScoreProvider().getScore();
      setState(() {
        score = value;
      });
    } catch (error) {
      // Add proper error handling/logging here
      print("Error fetching score: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 6,
                  height: width / 6,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          score ?? '0',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Overall Points",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 20, 85, 53),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 8,
                  height: width / 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 243, 255, 232),
                      ),
                      child: Center(
                        child: Text(
                          '${(int.parse(score) * (1 - factor)).toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 85, 53),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Eco Points",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 20, 85, 53),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: width / 8,
                  height: width / 8,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 20, 85, 53),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 243, 255, 232),
                      ),
                      child: Center(
                        child: Text(
                          '${(int.parse(score) * factor).toInt()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 85, 53),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Pal Points",
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(255, 20, 85, 53),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
