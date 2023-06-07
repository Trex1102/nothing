import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import '/core/error/failures.dart';

class RegisterUserUseCase {
  final UserRepository userRepository;

  RegisterUserUseCase(this.userRepository);

  Future<Either<Failures, void>> call({
    required String username,
    required String email,
    required String password,
  }) async {
    validateInputData(username, email, password);

    final newUser = UserEntity(
      id: '', //assign unique id
      username: username,
      email: email,
      password: password,
    );

    try {
      await userRepository.registerUser(newUser);
      return Right(null);
    } catch (e) {
      return Left(Failures('Failed to register user.'));
    }
  }

  void validateInputData(String username, String email, String password) {
    if (username.isEmpty) {
      throw Exception('Username is required');
    }

    if (email.isEmpty) {
      throw Exception('Email is required');
    }

    if (!isEmailValid(email)) {
      throw Exception('Invalid email format');
    }

    if (password.isEmpty) {
      throw Exception('Password is required');
    }

    if (password.length < 6) {
      throw Exception('Password should be at least 6 characters long');
    }
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }
}
