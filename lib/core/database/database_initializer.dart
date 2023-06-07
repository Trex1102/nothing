import 'package:sqflite/sqflite.dart';

class DatabaseInitializer {
  static Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      '$databasePath/nothing_test.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE expenses (
            id TEXT PRIMARY KEY,
            userId TEXT,
            amount REAL,
            date INTEGER,
            time TEXT,
            note TEXT,
            weather TEXT,
            categoryId TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE users (
            id TEXT PRIMARY KEY,
            username TEXT,
            email TEXT,
            password TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE incomes(
            id TEXT PRIMARY KEY,
            userId TEXT,
            amount REAL,
            date INTEGER,
            time TEXT,
            note TEXT,
            categoryId TEXT
            )
        ''');
      },
    );
    return database;
  }

  static Future<void> clearDatabase(Database database) async {
    await database.delete('expenses');
    await database.delete('users');
    await database.delete('incomes');
  }
}
