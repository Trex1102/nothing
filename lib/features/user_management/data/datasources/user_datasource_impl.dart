import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';
import '/../../../core/error/exceptions.dart';

class UserDataSourceImpl implements UserDataSource {
  final UserLocalStorage localStorage;

  UserDataSourceImpl(this.localStorage);

  @override
  Future<void> registerUser(UserModel userModel) async {
    try {
      await localStorage.registerUser(userModel);
    } catch (e) {
      print('Failed to create user: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<UserModel> loginUser(String email, String password) async {
    try {
      return await localStorage.loginUser(email, password);
    } catch (e) {
      print('Failed to find user: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      return await localStorage.getAllUsers();
    } catch(e) {
      print('Failed to find user: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<UserModel> getCurrentUser() {
    try {
      return localStorage.getCurrentUser();
    } catch (e) {
      throw Exception('Failed to get user profile');
    }
  }

  @override
  Future<UserModel> getUserByUsername(String username) async {
    try {
      return await localStorage.getUserByUsername(username);
    } catch (e) {
      print('Failed to fetch username: $e');
      throw DataSourceException();
    }
  }

    @override
  Future<UserModel> getUserByEmail(String email) async {
    try {
      return await localStorage.getUserByEmail(email);
    } catch (e) {
      print('Failed to fetch username: $e');
      throw DataSourceException();
    }
  }

}
