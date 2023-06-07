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

      },
    );

    return database;
  }
}
