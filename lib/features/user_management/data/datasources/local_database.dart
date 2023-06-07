import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../core/error/exceptions.dart' as exceptions;

class LocalStorage {
  final Database database;

  LocalStorage(this.database);

  Future<void> registerUser(UserModel user) async {
    try {
      await database.insert('users', user.toJson());
    } catch (e) {
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
}