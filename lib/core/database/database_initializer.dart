import 'package:sqflite/sqflite.dart';

class DatabaseInitializer {
  static Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase(
      '$databasePath/your_database_name.db',
      version: 1,
      onCreate: (db, version) {
        // Define your database schema and tables here
        // This function will be called when the database is created for the first time
      },
    );

    return database;
  }
}
