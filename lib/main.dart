import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:nothing/core/test/add_expense_bloc_test.dart';
import 'package:nothing/features/expense_management/presentation/get_expense_by_id_presentor/pages/view_expense_screen.dart';
import 'package:nothing/features/expense_management/presentation/get_expense_by_id_presentor/widgets/expense_details.dart';
import 'package:nothing/features/homepage/presentation/pages/expense_screen.dart';
import 'package:nothing/features/user_management/domain/usecases/get_current_user_usecase.dart';
import 'package:nothing/features/user_management/presentation/login_presenter/widgets/login_form.dart';
import 'core/database/database_initializer.dart';

// Import the necessary files for the bloc

import 'package:nothing/features/user_management/data/datasources/user_datasource_impl.dart';
import 'package:nothing/features/user_management/data/repositories/user_repository_impl.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';

import 'features/statistics/presentation/pages/statistics_screen.dart';
import 'features/user_management/domain/entities/user_entity.dart';
import 'features/user_management/domain/usecases/get_users_usecase.dart';
import 'package:nothing/features/user_management/presentation/register_presenter/widgets/register_form.dart';

import 'features/user_profile/presentation/widgets/user_profile_form.dart';

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

  //DatabaseInitializer.clearDatabase(database);

  final getAllUsersUseCase = GetAllUsersUseCase(userRepository);

  await getAllUsersUseCase.call().then((result) {
    result.fold(
      (failure) => print('Failed to fetch users: $failure'),
      (users) => users.forEach((user) => print(user)),
    );
  });

  // void printCurrentUser(UserEntity user) {
  //   print('Current User:');
  //   print('ID: ${user.id}');
  //   print('Username: ${user.username}');
  //   print('Email: ${user.email}');
  //   print('isLoggedIn: ${user.isLoggedIn}');
  // }

  // final getCurrentUserUsecase = GetCurrentUserUsecase(userRepository);
  // final currentUser = await getCurrentUserUsecase.call();
  // printCurrentUser(currentUser);

  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final UserRepository userRepository;

  MyApp({required this.userRepository});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FinTracker',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          body: HomepageExpenseScreen(),

          //UserProfileForm(userRepository: userRepository),

          // LoginForm(userRepository: userRepository),

          // RegisterForm(userRepository: userRepository),
          //HomepageExpenseScreen()
          //StatisticsScreen()

          //),
          // initialRoute: '/register',
          // routes: {
          //   '/register': (context) => RegisterForm(),
          //   '/login': (context) => LoginForm(),
          // },
        ));
  }
}
