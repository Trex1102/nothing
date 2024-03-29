import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:nothing/features/expense_management/data/datasources/expense_datasource_impl.dart';
import 'package:nothing/features/expense_management/data/repositories/expense_repository_impl.dart';
import 'package:nothing/features/expense_management/domain/entities/category_entity.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';
import 'package:nothing/features/expense_management/domain/usecases/create_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/delete_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/get_expenses_by_user.dart';
import 'package:nothing/features/expense_management/domain/usecases/update_expense.dart';
import 'package:nothing/features/expense_management/domain/usecases/get_expense_by_id.dart';
import 'package:uuid/uuid.dart';

import '../../features/expense_management/data/datasources/local_storage.dart';
import '../../features/expense_management/domain/entities/expense_entity.dart';
import '../../core/database/database_initializer.dart';

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

  // Create the use cases
  CreateExpense createExpense = CreateExpense(expenseRepository);
  GetExpensesByUser getExpensesByUser = GetExpensesByUser(expenseRepository);
  DeleteExpense deleteExpense = DeleteExpense(expenseRepository);
  UpdateExpense updateExpense = UpdateExpense(expenseRepository);
  GetExpenseById getExpenseById = GetExpenseById(expenseRepository);

  final uuid = Uuid();

  // Test the CreateExpense use case
  createExpense
      .call(
    id: uuid.v4(),
    userId: 'user123',
    amount: 50.0,
    date: DateTime.now(),
    time: TimeOfDay.now(),
    note: 'Expense note',
    weather: WeatherType.sunny,
    category: predefinedCategories[0],
  )
      .then((result) {
    result.fold(
      (failure) => print('Expense creation failed: $failure'),
      (_) => print('Expense created successfully'),
    );

    // Test the ViewExpenseByUser use case
    // Test the ViewExpenseByUser use case
    final userId = 'user123'; // Replace with the desired user ID
    getExpensesByUser.call(userId: userId).then((result) {
      result.fold(
        (failure) => print('Failed to fetch expenses by user: $failure'),
        (expenses) {
          print('Expenses for user $userId:');
          expenses.forEach((expense) {
            print('ID: ${expense.id}');
            print('User ID: ${expense.userId}');
            print('Amount: ${expense.amount}');
            print('Date: ${expense.date}');
            print('Time: ${expense.time}');
            print('Note: ${expense.note}');
            print('Weather: ${expense.weather}');
            print('Category ID: ${expense.category.id}');
            print('------------------------');
          });
        },
      );
    });

    // Test the UpdateExpense use case
    // Replace with the expense to be updated
    ExpenseEntity updatedExpense = ExpenseEntity(
      id: '2fdf42dd-3f88-44db-9782-46b2131ec780',
      userId: 'saikat',
      amount: 60.0,
      date: DateTime.now(),
      time: TimeOfDay.now(),
      note: 'Updated expense note',
      weather: WeatherType.rainy,
      category: predefinedCategories[1],
    );

    updateExpense.call(expense: updatedExpense).then((result) {
      result.fold(
        (failure) => print('Failed to update expense: $failure'),
        (_) => print('Expense updated successfully'),
      );

      // Get the updated expense by ID
      getExpenseById.call(updatedExpense.id).then((result) {
        result.fold(
          (failure) => print('Failed to get expense by ID: $failure'),
          (expense) {
            print('Updated Expense:');
            print('ID: ${expense.id}');
            print('User ID: ${expense.userId}');
            print('Amount: ${expense.amount}');
            print('Date: ${expense.date}');
            print('Time: ${expense.time}');
            print('Note: ${expense.note}');
            print('Weather: ${expense.weather}');
            print('Category ID: ${expense.category.id}');
          },
        );
      });
    });

    // Test the DeleteExpense use case
    String expenseId =
        'ea28855a-0c32-44c5-b44f-8c67a9a00f8d'; // Replace with the ID of the expense to be deleted

    deleteExpense.call(expenseId).then((result) {
      result.fold(
        (failure) => print('Failed to delete expense: $failure'),
        (_) => print('Expense deleted successfully'),
      );
    });
  });
}
