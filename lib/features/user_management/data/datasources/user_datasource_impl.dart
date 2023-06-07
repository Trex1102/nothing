// import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
// import 'package:nothing/features/user_management/data/models/user_model.dart';
// import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
// import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
// import 'package:nothing/features/user_management/data/datasources/user_database.dart';

// class UserDataSourceImpl implements UserDataSource {
//   final UserDatabase userDatabase;

//   UserDataSourceImpl(this.userDatabase);

//   @override
//   Future<void> registerUser(UserModel userModel) async {
//     final userEntity = UserEntity.registerUser(userModel);
//     await userDatabase.insertUser(userEntity);
//   }

//   @override
//   Future<UserModel?> loginUser(String email, String password) async {
//     final userEntity = await userDatabase.getUserByEmail(email);

//     if (userEntity != null && userEntity.password == password) {
//       return userEntity.toModel();
//     }

//     return null;
//   }
// }
