class Leaderboard {
  final List<LeaderboardEntry> entries;

  Leaderboard({
    required this.entries,
  });

  factory Leaderboard.fromJson(List<dynamic> json) {
    List<LeaderboardEntry> entries = [];
    for (var entry in json) {
      entries.add(LeaderboardEntry.fromJson(entry));
    }
    return Leaderboard(entries: entries);
  }
}

class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry({
    required this.name,
    required this.score,
  });

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(name: json['name'], score: json['score']);
  }
}
