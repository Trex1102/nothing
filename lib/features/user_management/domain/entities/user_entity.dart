class UserEntity {
  final String id;
  final String username;
  final String email;
  final String password;
  final String isLoggedIn;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.isLoggedIn,
  });

  UserEntity copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? isLoggedIn,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoggedIn : isLoggedIn ?? this.isLoggedIn
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email &&
          password == other.password  &&
          isLoggedIn == other.isLoggedIn;

  @override
  int get hashCode =>
      id.hashCode ^ username.hashCode ^ email.hashCode ^ password.hashCode ^ isLoggedIn.hashCode;

  @override
  String toString() {
    return 'UserEntity{id: $id, username: $username, email: $email, password: $password, isLoggedIn: $isLoggedIn}';
  }
}
