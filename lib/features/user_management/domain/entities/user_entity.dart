

class UserEntity {
  final String id;
  final String username;
  final String email;
  final String password;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  UserEntity copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
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
          password == other.password;

  @override
  int get hashCode =>
      id.hashCode ^ username.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'UserEntity{id: $id, username: $username, email: $email, password: $password}';
  }
}
