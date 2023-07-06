import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:nothing/features/user_management/domain/usecases/get_current_user_usecase.dart';
import '/core/error/failures.dart';

class LoginUserUseCase {
  final UserRepository userRepository;

  LoginUserUseCase(this.userRepository);

  Future<Either<Failures, UserEntity>> call(
      String email, String password) async {
    try {
      final user = await userRepository.loginUser(email, password);
      //final loggedInUser = user.copyWith(isLoggedIn: '1');
      //await userRepository.updateUser(loggedInUser);
      //return Right(loggedInUser);
      final userEntity = UserEntity(
          id: user.id,
          username: user.username,
          email: user.email,
          password: user.password,
          isLoggedIn: '1');
      userRepository.setCurrentUser(userEntity);
      return Right(userEntity);
    } catch (e) {
      return Left(Failures('Failed to login user.'));
    }
  }
}
