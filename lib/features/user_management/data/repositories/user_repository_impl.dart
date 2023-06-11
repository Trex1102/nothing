import 'package:nothing/core/error/exceptions.dart';
import 'package:nothing/core/network/network_info.dart';
import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.userDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> registerUser(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel(
          id: user.id,
          email: user.email,
          password: user.password,
          username: user.username,
        );
        await userDataSource.registerUser(userModel);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<UserEntity> loginUser(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await userDataSource.loginUser(email, password);
        return UserEntity(
          id: userModel.id,
          email: userModel.email,
          username: userModel.username,
          password: userModel.password,
        );
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final List<UserModel> userModels = await userDataSource.getAllUsers();
        return userModels.map((model) => 
        UserEntity(
          id: model.id,
          email: model.email,
          username: model.username,
          password: model.password,
        )).toList();
        //return users;
      } catch (e) {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<bool> isUsernameTaken(String username) async {
    // Implement the logic to check if username is taken in the data layer
    // using the UserDataSource
    try {
      final user = await userDataSource.getUserByUsername(username);
      return user != null;
    } catch (e) {
      return false;
    }
  }

    @override
  Future<bool> isEmailTaken(String email) async {
    // Implement the logic to check if email is taken in the data layer
    // using the UserDataSource
    try {
      final user = await userDataSource.getUserByEmail(email);
      return user != null;
    } catch (e) {
      // Handle any exceptions or errors
      return false;
    }
  }

}
