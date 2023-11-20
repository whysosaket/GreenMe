import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro_demo/models/score.dart';

class ScoreProvider extends ChangeNotifier {
  Score? _score;

  Score? get score => _score;

  Future<String> getScore() async {
    try {
      final response = await http.get(
        Uri.parse('https://trithon-application.vercel.app/api/score'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['success'] == true) {
        // Assuming you have a Score.fromJson constructor
        _score = Score.fromJson(responseData['score'].toString());
        notifyListeners();
        return responseData['score'].toString();
      } else {
        throw Exception(responseData['error']);
      }
    } catch (error) {
      throw Exception('Failed to connect to the server. Please try again.');
    }
  }

  void setScore(Score newScore) {
    _score = newScore;
    notifyListeners();
  }
}
