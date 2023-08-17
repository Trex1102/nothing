import 'package:dartz/dartz.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../repositories/user_repository.dart';

class GetCurrentUserUsecase {
  final UserRepository userRepository;

  GetCurrentUserUsecase(this.userRepository);

  Future<UserEntity> call(
      // Future<Either<Failure, UserEntity>> call(
      ) async {
    try {
      final userProfile = await userRepository.getCurrentUser();
      return userProfile;
      // Right(userProfile);
    } catch (e) {
      throw Left(Exception('Failed to fetch user profile. get cur usecase'));
    }
  }
}
