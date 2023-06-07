//local

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:nothing/features/user_management/data/models/user_model.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user_database.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final pathToDb = path.join(dbPath, dbName);
    return await openDatabase(
      pathToDb,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        username TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(UserModel userModel) async {
    final db = await instance.database;
    return await db.insert(
      'users',
      userModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Future<void> updateUser(UserModel userModel) async {
  //   final db = await instance.database;
  //   await db.update(
  //     'users',
  //     userModel.toJson(),
  //     where: 'id = ?',
  //     whereArgs: [userModel.id],
  //   );
  // }
}
