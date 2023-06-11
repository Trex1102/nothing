import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '/core/error/failures.dart';

class GetAllUsersUseCase {
  final UserRepository userRepository;

  GetAllUsersUseCase(this.userRepository);

  Future<Either<Failures, List<UserEntity>>> call() async {
    try {
      final users = await userRepository.getAllUsers();
      return Right(users);
    } catch (e) {
      return Left(Failures('Failed to retrieve users.'));
    }
  }
}