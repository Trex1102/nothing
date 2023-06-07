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
      final userModel = UserModel(
        id: user.id,
        email: user.email,
        password: user.password,
        username: user.username,
      );
      return userDataSource.registerUser(userModel);
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<UserEntity?> loginUser(String email, String password) async {
    if (await networkInfo.isConnected) {
      return userDataSource.loginUser(email, password).then((userModel) {
        if (userModel != null) {
          return UserEntity(
            id: userModel.id,
            email: userModel.email,
            username: userModel.username,
            password: userModel.password,
          );
        }
        return null;
      });
    } else {
      throw NetworkException();
    }
  }
}
