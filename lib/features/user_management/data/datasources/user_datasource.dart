import 'package:nothing/features/user_management/data/models/user_model.dart';

abstract class UserDataSource {
  Future<void> registerUser(UserModel userModel);
  Future<UserModel?> loginUser(String email, String password);
}

