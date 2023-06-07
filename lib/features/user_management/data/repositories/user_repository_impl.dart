import 'package:nothing/features/user_management/data/datasources/user_datasource.dart';
import 'package:nothing/features/user_management/data/models/user_model.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<void> registerUser(UserEntity user) {
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      password: user.password,
      username: user.username,
    );
    return userDataSource.registerUser(userModel);
  }

  @override
  Future<UserEntity?> loginUser(String email, String password) {
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
  }
}
