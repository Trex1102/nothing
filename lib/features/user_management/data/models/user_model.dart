class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String isLoggedIn;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isLoggedIn,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      isLoggedIn : json['isLoggedIn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'isLoggedIn': isLoggedIn,
    };
  }
}
