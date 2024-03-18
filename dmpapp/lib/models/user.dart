class User {
  final String token;

  User({required this.token});

  factory User.fromSqfliteDatabase(Map<String,dynamic> map) =>
    User(token: map['token'] ?? "");
}
