class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String username;
  final String avatar;
  final int score;
  final List<String> awards;
  final List<String> followers;
  final List<String> following;
  final List<String> stories;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.username,
    required this.avatar,
    required this.score,
    required this.awards,
    required this.followers,
    required this.following,
    required this.stories,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      avatar: json['avatar'],
      score: json['score'],
      awards: List<String>.from(json['awards']),
      followers: List<String>.from(json['followers']),
      following: List<String>.from(json['following']),
      stories: List<String>.from(json['stories']),
    );
  }
}
