import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:nothing/features/user_management/data/datasources/user_database.dart';

class UserDataSourceImpl implements UserDataSource {
  final UserDatabase userDatabase;

  UserDataSourceImpl(this.userDatabase);

  @override
  Future<void> registerUser(UserModel userModel) async {
    await userDatabase.registerUser(userModel);
  }

  @override
  Future<UserModel?> loginUser(String email, String password) async {

    return await userDatabase.loginUser(email, password);
  }
}
