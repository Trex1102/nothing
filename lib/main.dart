import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'core/database/database_initializer.dart';

// Import the necessary files for the bloc

import 'package:nothing/features/user_management/data/datasources/user_datasource_impl.dart';
import 'package:nothing/features/user_management/data/repositories/user_repository_impl.dart';
import 'package:nothing/features/user_management/domain/repositories/user_repository.dart';
import 'package:nothing/features/user_management/data/datasources/local_storage.dart';

import 'features/user_management/domain/usecases/get_users_usecase.dart';
import 'package:nothing/features/user_management/presentation/register_presenter/widgets/register_form.dart';

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

  runApp(MyApp(userRepository: userRepository,));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

    final UserRepository userRepository;

    MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTracker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
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
      RegisterForm(userRepository: userRepository),
    //),
      // initialRoute: '/register',
      // routes: {
      //   '/register': (context) => RegisterForm(),
      //   '/login': (context) => LoginForm(),
      // },
    );
  }
}

// class MyApp extends StatelessWidget {
//   final UserRepository userRepository;

//   MyApp({required this.userRepository});

//   @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'demo',
//     home: MultiBlocProvider(
//       providers: [
//         BlocProvider<LoginBloc>(
//           create: (_) => LoginBloc(loginUserUseCase: LoginUserUseCase(userRepository)),
//         ),
//         BlocProvider<RegisterBloc>(
//           create: (_) => RegisterBloc(registerUserUseCase: RegisterUserUseCase(userRepository)),
//         ),
//       ],
//       child: HomePage(),
//     ),
//   );
// }

// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final registerBloc = BlocProvider.of<RegisterBloc>(context);
//     final loginBloc = BlocProvider.of<LoginBloc>(context);

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocConsumer<RegisterBloc, RegisterState>(
//               listener: (context, state) {
//                 if (state is RegisterSuccess) {
//                   showDialog(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                             title: Text('Reg success'),
//                             content: Text('suc'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('ok'),
//                               ),
//                             ],
//                           ));
//                 } else if (state is RegisterFailure) {
//                   showDialog(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                             title: Text('Reg failed'),
//                             content: Text('ff'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('ok'),
//                               ),
//                             ],
//                           ));
//                 }
//               },
//               builder: (context, state) {
//                 return ElevatedButton(
//                   onPressed: () {
//                     registerBloc.add(
//                       RegisterButtonPressed(
//                         user: UserEntity(
//                           id: '1',
//                           username: 'ibasa',
//                           email: 'ii@example.com',
//                           password: 'pass123',
//                         ),
//                       ),
//                     );
//                   },
//                   child: const Text('Register'),
//                 );
//               },
//             ),
//             BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             if (state is LoginSuccess) {
//               showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                         title: Text('login success'),
//                         content: Text('suc'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('ok'),
//                           ),
//                         ],
//                       ));
//             } else if (state is LoginFailure) {
//               showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                         title: Text('login failed'),
//                         content: Text('ff'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('ok'),
//                           ),
//                         ],
//                       ));
//             }
//           },
//           builder: (context, state) {
//             return ElevatedButton(
//               onPressed: () {
//                 loginBloc.add(
//                   LoginButtonPressed(
//                     user: UserEntity(
//                       id: '1',
//                       username: 'ibasa',
//                       email: 'ii@example.com',
//                       password: 'pass123',
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Login'),
//             );
//           },
//         ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// import 'features/expense_management/presentation/add_expense_presenter/widgets/show_amount_field.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Show Amount Field Example'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16),
//           child: ShowAmountFieldWidget(),
//         ),
//       ),
//     );
//   }
// }

// class ShowAmountFieldWidget extends StatefulWidget {
//   @override
//   _ShowAmountFieldWidgetState createState() => _ShowAmountFieldWidgetState();
// }

// class _ShowAmountFieldWidgetState extends State<ShowAmountFieldWidget> {
//   String amount = '100';
//   String selectedCurrency = 'TK';
//   List<String> currencyOptions = ['USD', 'EUR', 'GBP', 'TK'];

//   void onCurrencyChanged(String? value) {
//     setState(() {
//       selectedCurrency = value ?? '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ShowAmountField(
//       amount: amount,
//       selectedCurrency: selectedCurrency,
//       currencyOptions: currencyOptions,
//       onCurrencyChanged: onCurrencyChanged,
//     );
//   }
// }
