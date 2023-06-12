import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

import '../repositories/user_repository.dart';


class GetCurrentUserUsecase {
  final UserRepository userRepository;

  GetCurrentUserUsecase(this.userRepository);

  Future<UserEntity> call() async {
    try {
      // Retrieve the user profile data from the data source
      final userProfile = await userRepository.getCurrentUser();

      // Map the data to the User entity
      final user = UserEntity(
        id: userProfile.id,
        username: userProfile.username,
        email: userProfile.email,
        password: userProfile.password
        // Set other user properties based on the retrieved data
        // ...
      );

      return user;
    } catch (e) {
      throw Exception('Failed to fetch user profile');
    }
  }
}
