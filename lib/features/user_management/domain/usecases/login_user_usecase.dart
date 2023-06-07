import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import '/core/error/failures.dart';

class LoginUserUseCase {
  final UserRepository userRepository;

  LoginUserUseCase(this.userRepository);

  Future<Either<Failures, UserEntity>> call(String email, String password) async {
    try {
      final user = await userRepository.loginUser(email, password);

      if (user != null) {
        final userEntity = UserEntity(
          id: user.id,
          username: user.username,
          email: user.email,
          password: user.password,
        );
        return Right(userEntity);
      } else {
        return Left(Failures('Invalid email or password'));
      }
    } catch (e) {
      return Left(Failures('Failed to login user.'));
    }
  }
}






