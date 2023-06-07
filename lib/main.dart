import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:nothing/features/add_expense/data/datasources/expense_datasource_impl.dart';
import 'package:nothing/features/add_expense/domain/entities/category_entity.dart';
import 'package:nothing/core/database/database_initializer.dart';

import '../../features/add_expense/data/datasources/local_storage.dart';
import '../../features/add_expense/data/repositories/expense_repository_impl.dart';
import '../../features/add_expense/domain/entities/expense_entity.dart';
import '../../features/add_expense/domain/repositories/expense_repository.dart';
import '../../features/add_expense/domain/usecases/create_expense.dart';

void main() async {
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

  // Create an instance of the CreateExpense use case
  CreateExpense createExpense = CreateExpense(expenseRepository);

  // Test the CreateExpense use case
  createExpense
      .call(
    userId: 'user123',
    amount: 50.0,
    date: DateTime.now(),
    time: TimeOfDay.now(),
    note: 'Expense note',
    weather: WeatherType.sunny,
    category: predefinedCategories[0],
  )
      .then((result) async {
    result.fold(
      // ignore: avoid_print
      (failure) => print('Expense creation failed: $failure'),
      // ignore: avoid_print
      (voidResult) => print('Expense created successfully'),
    );

    final userId = 'user123'; // Replace with the desired user ID
    try {
      final expenses = await expenseDataSource.getExpensesByUser(userId);
      print('Expenses for user $userId:');
      expenses.forEach((expense) {
        print('ID: ${expense.id}');
        print('User ID: ${expense.userId}');
        print('Amount: ${expense.amount}');
        print('Date: ${expense.date}');
        print('Time: ${expense.time}');
        print('Note: ${expense.note}');
        print('Weather: ${expense.weather}');
        print('Category ID: ${expense.categoryId}');
        print('------------------------');
      });
    } catch (e) {
      print('Failed to fetch expenses: $e');
    }
  });

  // Fetch and display the expenses for a specific user from the database
}
