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
  });
}
