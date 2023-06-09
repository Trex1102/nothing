import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import the necessary files for the bloc
import 'package:nothing/features/expense_management/presentation/add_expense_presenter/bloc/add_expense_bloc.dart';
import 'package:nothing/features/expense_management/presentation/delete_expense_presenter/bloc/delete_expense_bloc.dart';

import '../../core/database/database_initializer.dart';
import '../../core/network/network_info_impl.dart';
import '../../features/expense_management/data/datasources/expense_datasource_impl.dart';
import '../../features/expense_management/data/datasources/local_storage.dart';
import '../../features/expense_management/data/repositories/expense_repository_impl.dart';
import '../../features/expense_management/domain/entities/expense_entity.dart';
import '../../features/expense_management/domain/repositories/expense_repository.dart';
import '../../features/expense_management/domain/usecases/create_expense.dart';
import '../../features/expense_management/domain/usecases/delete_expense.dart';
import '../../features/expense_management/domain/entities/category_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final database = await DatabaseInitializer.initDatabase();

  Connectivity connectivity = Connectivity();

  // Create an instance of LocalStorage
  LocalStorage localStorage = LocalStorage(database);

  // Create an instance of the ExpenseDataSource
  ExpenseDataSourceImpl expenseDataSource = ExpenseDataSourceImpl(localStorage);

  // Create an instance of the NetworkInfo
  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectivity);

  // Create an instance of the ExpenseRepository
  ExpenseRepository expenseRepository = ExpenseRepositoryImpl(
    expenseDataSource: expenseDataSource,
    networkInfo: networkInfo,
  );

  runApp(MyApp(expenseRepository: expenseRepository));
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository;

  MyApp({required this.expenseRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Management Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AddExpenseBloc>(
            create: (_) => AddExpenseBloc(
              createExpense: CreateExpense(expenseRepository),
            ),
          ),
          BlocProvider<DeleteExpenseBloc>(
            create: (_) => DeleteExpenseBloc(
              deleteExpense: DeleteExpense(expenseRepository),
            ),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addExpenseBloc = BlocProvider.of<AddExpenseBloc>(context);
    final deleteExpenseBloc = BlocProvider.of<DeleteExpenseBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Management Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<AddExpenseBloc, AddExpenseState>(
              listener: (context, state) {
                if (state.status == AddExpenseStatus.success) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Success'),
                      content: const Text('Expense created successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else if (state.status == AddExpenseStatus.failure) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Failure'),
                      content: const Text('Failed to create expense.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    // Dispatch the AddExpenseButtonPressed event
                    addExpenseBloc.add(
                      AddExpenseButtonPressed(
                        expense: ExpenseEntity(
                          id: '6',
                          userId: '123',
                          amount: 100.0,
                          date: DateTime.now(),
                          time: TimeOfDay.now(),
                          note: 'Expense Note',
                          weather: WeatherType.sunny,
                          category: predefinedCategories[0],
                        ),
                      ),
                    );
                  },
                  child: const Text('Add Expense'),
                );
              },
            ),
            const SizedBox(height: 16),
            BlocConsumer<DeleteExpenseBloc, DeleteExpenseState>(
              listener: (context, state) {
                if (state.status == DeleteExpenseStatus.success) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Success'),
                      content: const Text('Expense deleted successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else if (state.status == DeleteExpenseStatus.failure) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Failure'),
                      content: const Text('Failed to delete expense.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    // Dispatch the DeleteExpenseButtonPressed event
                    deleteExpenseBloc.add(
                      DeleteExpenseButtonPressed(expenseId: '6'),
                    );
                  },
                  child: const Text('Delete Expense'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
