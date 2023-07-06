import 'package:nothing/features/user_management/data/models/user_model.dart';

abstract class UserDataSource {
  Future<void> registerUser(UserModel userModel);
  Future<UserModel> loginUser(String email, String password);
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUserByUsername(String username);
  Future<UserModel> getUserByEmail(String email);
  Future<UserModel> getCurrentUser();
  
  //Future<void> updateUser(UserModel userModel);
}
