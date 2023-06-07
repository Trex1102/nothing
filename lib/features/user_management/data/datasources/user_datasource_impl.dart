import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:nothing/features/user_management/data/datasources/local_database.dart';

class UserDataSourceImpl implements UserDataSource {
  final LocalStorage localStorage;

  UserDataSourceImpl(this.localStorage);

  @override
  Future<void> registerUser(UserModel userModel) async {
    await localStorage.registerUser(userModel);
  }

  @override
  Future<UserModel?> loginUser(String email, String password) async {

    return await localStorage.loginUser(email, password);
  }
}
