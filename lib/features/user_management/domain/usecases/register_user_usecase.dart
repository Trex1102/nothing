import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import '/core/error/failures.dart';

class RegisterUserUseCase {
  final UserRepository userRepository;

  RegisterUserUseCase(this.userRepository);

  Future<Either<Failures, void>> call({
    required String username,
    required String email,
    required String password,
  }) async {
    final isUsernameTaken = await userRepository.isUsernameTaken(username);
    if (isUsernameTaken) {
      return Left(Failures('Username is already taken'));
    }

    final isEmailTaken = await userRepository.isEmailTaken(email);
    if (isEmailTaken) {
      return Left(Failures('Email is already taken'));
    }

    validateInputData(username, email, password);

    final uuid = Uuid();
    final newUser = UserEntity(
      id: uuid.v4(), //assign unique id
      username: username,
      email: email,
      password: password,
      isLoggedIn: "0",
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
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }
}
