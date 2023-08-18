import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> registerUser(UserEntity user);
  //Future<bool>loginUser(String email, String password);

  //Future<void> registerUser(UserEntity user);
  Future<UserEntity> loginUser(String email, String password);

  Future<List<UserEntity>> getAllUsers();

  Future<bool> isUsernameTaken(String username);
  Future<bool> isEmailTaken(String email);

  Future<UserEntity> getCurrentUser();
  Future<void> setCurrentUser(UserEntity user);
  //Future<void> updateUser(UserEntity user);
}
