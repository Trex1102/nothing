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
      if (userMaps.isNotEmpty) {
        final userMap = userMaps.first;
        final UserModel user = UserModel.fromJson(userMap);

        // Set isLoggedIn to true
        //final logggedInUser = user.isLoggedIn = '1';

        // Update the user in the database
        await updateUser(user);

        return user;
      } else {
        throw exceptions.DatabaseException('Invalid email or password');
      }

      //return UserModel.fromJson(userMaps.first);
    } catch (e) {
      throw exceptions.DatabaseException('Invalid email or password');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      // bool l;
      // if (user.isLoggedIn == '1')
      //   l = true;
      // else
      //   l = false;
      await database.update(
        'users',
        {'isLoggedIn': '1'  },
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error updating user');
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final List<Map<String, dynamic>> userList = await database.query('users');
    return userList.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<UserModel> getCurrentUser() async {
    // final queryResult = await database.query(
    final List<Map<String, dynamic>> userMaps = await database.query(
      'users',
      where: 'isLoggedIn = ?',
      whereArgs: ['1'],
    );
    if (userMaps.isNotEmpty) {
      final userMap = userMaps.first;
      return UserModel.fromJson(userMap);
    } else {
      throw Exception('User profile not found local storage');
    }
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
    } else {
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
    } else {
      throw exceptions.DatabaseException('Email not found');
    }
  }
}
