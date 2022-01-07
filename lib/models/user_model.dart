class User {
  final String? username;
  final String? email;
  final String? password;

  User(
      {this.username,
        this.email,
        this.password,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}