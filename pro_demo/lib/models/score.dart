class Score {
  final String score;

  Score({
    required this.score,
  });

  factory Score.fromJson(String newScore) {
    return Score(
      score: newScore,
    );
  }
}
