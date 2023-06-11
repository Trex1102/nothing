import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/error/exceptions.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:test/expect.dart';
import '../../core/database/database_initializer.dart';

import 'package:nothing/features/user_management/data/datasources/user_datasource_impl.dart';
import 'package:nothing/features/user_management/data/repositories/user_repository_impl.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/domain/usecases/register_user_usecase.dart';
import 'package:nothing/features/user_management/domain/usecases/login_user_usecase.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';

import '../../features/user_management/domain/usecases/get_users_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final database = await DatabaseInitializer.initDatabase();

  Connectivity connectivity = Connectivity();

  // Create an instance of LocalStorage
  UserLocalStorage localStorage = UserLocalStorage(database);

  // Create an instance of the UserDataSource
  UserDataSourceImpl userDataSource = UserDataSourceImpl(localStorage);

  // Create an instance of the NetworkInfo
  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectivity);

  // Create an instance of the UserRepository
  UserRepository userRepository = UserRepositoryImpl(
    userDataSource: userDataSource,
    networkInfo: networkInfo,
  );

//await DatabaseInitializer.clearDatabase(database);

  //user_management test
  //Create the use cases
  RegisterUserUseCase registerUserUseCase = RegisterUserUseCase(userRepository);
  //Test the RegisterUserUseCase
  await registerUserUseCase
      .call(
    username: 'ii',
    email: 'ii@example.com',
    password: 'pass123',
  )
      .then((result) {
    result.fold(
      (failure) => print('User registration failed: $failure'),
      (_) => print('User registered successfully'),
    );
  });

  LoginUserUseCase loginUserUseCase = LoginUserUseCase(userRepository);
  final email = 'ii@example.com';
  final password = 'pass123';
  // Test the LoginUserUseCase
  await loginUserUseCase.call(email, password).then((result) {
    result.fold(
      (failure) => print('User login failed: $failure'),
      (user) => print('User logged in successfully: ${user.username}'),
    );
  });

  final getAllUsersUseCase = GetAllUsersUseCase(userRepository);

  await getAllUsersUseCase.call().then((result) {
    result.fold(
      (failure) => print('Failed to fetch users: $failure'),
      (users) => users.forEach((user) => print(user)),
    );
  });
}
