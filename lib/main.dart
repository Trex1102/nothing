import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/database/database_initializer.dart';

// Import the necessary files for the bloc
import 'package:nothing/features/expense_management/presentation/add_expense_presenter/bloc/add_expense_bloc.dart';
import 'package:nothing/features/expense_management/presentation/delete_expense_presenter/bloc/delete_expense_bloc.dart';

import 'package:nothing/features/expense_management/data/datasources/expense_datasource_impl.dart';
import 'package:nothing/features/expense_management/data/repositories/expense_repository_impl.dart';
import 'package:nothing/features/expense_management/domain/entities/category_entity.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';
import 'package:nothing/features/expense_management/domain/usecases/create_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/delete_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/get_expenses_by_user.dart';
import 'package:nothing/features/expense_management/domain/usecases/update_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/get_expense_by_id.dart';
import 'package:nothing/features/expense_management/data/datasources/local_storage.dart';

import 'package:nothing/features/income_management/data/datasources/income_datasource_impl.dart';
import 'package:nothing/features/income_management/data/repositories/income_repository_impl.dart';
import 'package:nothing/features/income_management/domain/entities/category_entity.dart';
import 'package:nothing/features/income_management/domain/repositories/income_repository.dart';
import 'package:nothing/features/income_management/domain/usecases/create_income.dart';
import 'package:nothing/features/income_management/domain/usecases/delete_income.dart';
import 'package:nothing/features/income_management/domain/usecases/get_incomes_by_user.dart';
import 'package:nothing/features/income_management/domain/usecases/update_income.dart';

import '../../features/income_management/data/datasources/local_storage.dart';
import '../../features/income_management/domain/entities/income_entity.dart';

import 'package:nothing/features/user_management/data/datasources/user_datasource_impl.dart';
import 'package:nothing/features/user_management/data/repositories/user_repository_impl.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/domain/usecases/register_user_usecase.dart';
import 'package:nothing/features/user_management/domain/usecases/login_user_usecase.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final database = await DatabaseInitializer.initDatabase();

  Connectivity connectivity = Connectivity();

  // Create an instance of userLocalStorage
  UserLocalStorage userLocalStorage = UserLocalStorage(database);

  // Create an instance of the UserDataSource
  UserDataSourceImpl userDataSource = UserDataSourceImpl(userLocalStorage);

  // Create an instance of the NetworkInfo
  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectivity);

  // Create an instance of the userRepository
  UserRepository userRepository = UserRepositoryImpl(
    userDataSource: userDataSource,
    networkInfo: networkInfo,
  );

  //user_management test
  // Create the use cases
  RegisterUserUseCase registerUserUseCase = RegisterUserUseCase(userRepository);
  // Test the RegisterUserUseCase
  await registerUserUseCase
      .call(
    username: 'ibasa',
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
}
