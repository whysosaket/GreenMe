import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pro_demo/models/leaderboard.dart';

class LeaderboardProvider extends ChangeNotifier {
  Leaderboard? _globalLeaderboard;
  Leaderboard? _friendLeaderboard;

  Leaderboard? get globalLeaderboard => _globalLeaderboard;

  Future<Leaderboard> getGlobal() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://trithon-application.vercel.app/api/leaderboard/global'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      // print(responseData['users']);
      if (responseData['success'] == true) {
        // Assuming you have a Leaderboard.fromJson constructor
        _globalLeaderboard = Leaderboard.fromJson(responseData['users']);
        notifyListeners();
        return _globalLeaderboard!;
      } else {
        throw Exception(responseData['error']);
      }
    } catch (error) {
      throw Exception('Failed to connect to the server. Please try again.');
    }
  }
}
