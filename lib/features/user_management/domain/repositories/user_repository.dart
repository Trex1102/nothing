
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> registerUser(UserEntity user);
  //Future<bool>loginUser(String email, String password);

  //Future<void> registerUser(UserEntity user);
  Future<UserEntity?> loginUser(String email, String password);
  //Future<UserEntity?> getUserByEmail(String email);
}
