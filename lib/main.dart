import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'features/expense_management/presentation/add_expense_presenter/widgets/header_widget.dart';
import 'features/expense_management/presentation/add_expense_presenter/widgets/numpad_widget.dart';

import 'package:nothing/features/user_management/data/datasources/user_datasource_impl.dart';
import 'package:nothing/features/user_management/data/repositories/user_repository_impl.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';

import 'features/statistics/presentation/pages/statistics_screen.dart';
import 'features/user_management/domain/usecases/get_users_usecase.dart';
import 'package:nothing/features/user_management/presentation/register_presenter/widgets/register_form.dart';

import 'features/statistics/presentation/widgets/pie_chart.dart';

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

  final getAllUsersUseCase = GetAllUsersUseCase(userRepository);

  await getAllUsersUseCase.call().then((result) {
    result.fold(
      (failure) => print('Failed to fetch users: $failure'),
      (users) => users.forEach((user) => print(user)),
    );
  });

  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: MyHomePage(),
=======
      home:
          // MultiBlocProvider(
          // providers: [
          //   BlocProvider<RegisterBloc>(
          //     create: (_) => RegisterBloc(registerUserUseCase: RegisterUserUseCase(userRepository)),
          //   ),
          //   BlocProvider<LoginBloc>(
          //      create: (_) => LoginBloc(loginUserUseCase: LoginUserUseCase(userRepository)),
          //    ),
          // ],
          // child:

          //ExpenseDetails(),
          //ExpenseDetailsPage(),
          // HomepageUpperNavbar(),
          StatisticsScreen(),

      //RegisterForm(userRepository: userRepository),

      //),
      // initialRoute: '/register',
      // routes: {
      //   '/register': (context) => RegisterForm(),
      //   '/login': (context) => LoginForm(),
      // },
>>>>>>> aea47a91793f31a33bcb4fad6443cef48923bbac
    );
  }
}

class MyHomePage extends StatelessWidget {
  final DateTime currentDate = DateTime.now();
  final String weatherIcon = "sunny"; // Replace with the weather icon string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 10),
            NumpadWidget(
              onKeyPressed: (value) {
                // Handle numpad key press
                print('Pressed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
