import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nothing/core/test/add_expense_bloc_test.dart';
import 'package:nothing/features/user_management/domain/entities/user_entity.dart';
import 'core/database/database_initializer.dart';

// Import the necessary files for the bloc
import 'package:nothing/features/user_management/presentation/register_presenter/bloc/register_presenter_bloc.dart';

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
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      home: BlocProvider(
        create: (_) => RegisterBloc(
            registerUserUseCase: RegisterUserUseCase(userRepository)),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      body: Center(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('Reg success'),
                        content: Text('suc'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ok'),
                          ),
                        ],
                      ));
            } else if (state is RegisterFailure) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text('Reg failed'),
                        content: Text('ff'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ok'),
                          ),
                        ],
                      ));
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                registerBloc.add(
                  RegisterButtonPressed(
                    user: UserEntity(
                      id: '1',
                      username: 'ibasa',
                      email: 'ii@example.com',
                      password: 'pass123',
                    ),
                  ),
                );
              },
              child: const Text('Register'),
            );
          },
        ),
      ),
    );
  }
}
