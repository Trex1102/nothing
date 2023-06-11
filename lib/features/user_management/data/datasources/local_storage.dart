import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../core/error/exceptions.dart' as exceptions;

class UserLocalStorage {
  final Database database;

  UserLocalStorage(this.database);

  Future<void> registerUser(UserModel user) async {
    try {
      await database.insert('users', user.toJson());
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

Future<UserModel> loginUser(String email, String password) async {
    try {
      final List<Map<String, dynamic>> userMaps = await database.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );
      return UserModel.fromJson(userMaps.first);
    } catch (e) {
      throw exceptions.DatabaseException('Error Message');
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final List<Map<String, dynamic>> userList = await database.query('users');
    return userList.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<UserModel> getUserByUsername(String username) async {
    final result = await database.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    else {
        throw exceptions.DatabaseException('Username not found');
    }
  }

    @override
  Future<UserModel> getUserByEmail(String email) async {
    final result = await database.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    else {
        throw exceptions.DatabaseException('Email not found');
    }
  }
  
}