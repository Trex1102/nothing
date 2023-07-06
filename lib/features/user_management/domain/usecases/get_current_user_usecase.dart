import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

import '../repositories/user_repository.dart';


class GetCurrentUserUsecase {
  final UserRepository userRepository;

  GetCurrentUserUsecase(this.userRepository);

  Future<UserEntity> call() async {
    try {
      
      final userProfile = await userRepository.getCurrentUser();
      return userProfile;
    } catch (e) {
      throw Exception('Failed to fetch user profile. get cur usecase');
    }
  }
}
