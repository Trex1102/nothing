

// import 'package:test/test.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../../features/user_management/data/datasources/local_database.dart'; // Replace with the actual path to your UserDatabase file
// import '../../features/user_management/data/models/user_model.dart'; // Replace with the actual path to your UserModel file

// void main() {
//   late LocalStorage userDatabase;
//   late Database database;

//   setUp(() async {
//     final dbPath = await getDatabasesPath();
//     final databasePath = join(dbPath, 'test.db');
//     database = await openDatabase(databasePath, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE userTable (id INTEGER PRIMARY KEY, '
//           'username TEXT, password TEXT)');
//     });
//     userDatabase = LocalStorage(database);
//   });

//   tearDown(() async {
//     await database.close();
//   });

//   test('User Registration and Login Test', () async {
//     // Register a user
//     final user = UserModel(id: 1, username: 'john', password: 'password123');
//     await userDatabase.registerUser(user);

//     // Login with valid credentials
//     final loggedInUser = await userDatabase.loginUser('john', 'password123');
//     expect(loggedInUser, isNotNull);
//     expect(loggedInUser?.id, equals(user.id));
//     expect(loggedInUser?.username, equals(user.username));
//     expect(loggedInUser?.password, equals(user.password));

//     // Login with invalid credentials
//     final invalidUser = await userDatabase.loginUser('john', 'wrongpassword');
//     expect(invalidUser, isNull);
//   });
// }
