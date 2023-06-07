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

import 'features/expense_management/data/datasources/local_storage.dart';
import 'features/expense_management/domain/entities/expense_entity.dart';
import 'core/database/database_initializer.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final database = await DatabaseInitializer.initDatabase();

  Connectivity connectivity = Connectivity();

  // Create an instance of LocalStorage
  LocalStorage localStorage = LocalStorage(database);
  IncomeLocalStorage incomeLocalStorage = IncomeLocalStorage(database);

  // Create an instance of the ExpenseDataSource
  ExpenseDataSourceImpl expenseDataSource = ExpenseDataSourceImpl(localStorage);

  IncomeDataSourceImpl incomeDataSource =
      IncomeDataSourceImpl(incomeLocalStorage);

  // Create an instance of the NetworkInfo
  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectivity);

  // Create an instance of the ExpenseRepository
  ExpenseRepository expenseRepository = ExpenseRepositoryImpl(
    expenseDataSource: expenseDataSource,
    networkInfo: networkInfo,
  );

  IncomeRepository incomeRepository = IncomeRepositoryImpl(
    incomeDataSource: incomeDataSource,
    networkInfo: networkInfo,
  );

  // Create the use cases
  CreateExpense createExpense = CreateExpense(expenseRepository);
  GetExpensesByUser getExpensesByUser = GetExpensesByUser(expenseRepository);
  DeleteExpense deleteExpense = DeleteExpense(expenseRepository);
  UpdateExpense updateExpense = UpdateExpense(expenseRepository);

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
            print('Category ID: ${expense.id}');
            print('------------------------');
          });
        },
      );
    });

    // Test the UpdateExpense use case
    // Replace with the expense to be updated
    ExpenseEntity updatedExpense = ExpenseEntity(
      id: 'expense123',
      userId: 'user123',
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
    });

    // Test the DeleteExpense use case
    // Test the DeleteExpense use case
    String expenseId =
        'expense123'; // Replace with the ID of the expense to be deleted

    deleteExpense.call(expenseId).then((result) {
      result.fold(
        (failure) => print('Failed to delete expense: $failure'),
        (_) => print('Expense deleted successfully'),
      );
    });
  });

  // Create the use cases
  CreateIncome createIncome = CreateIncome(incomeRepository);
  GetIncomesByUser getIncomesByUser = GetIncomesByUser(incomeRepository);
  DeleteIncome deleteIncome = DeleteIncome(incomeRepository);
  UpdateIncome updateIncome = UpdateIncome(incomeRepository);

  // Test the CreateIncome use case
  createIncome
      .call(
    userId: 'user123',
    amount: 50.0,
    date: DateTime.now(),
    time: TimeOfDay.now(),
    note: 'Income note',
    category: predefinedIncomeCategories[0],
  )
      .then((result) {
    result.fold(
      (failure) => print('Income creation failed: $failure'),
      (_) => print('Income created successfully'),
    );

    // Test the ViewIncomeByUser use case
    // Test the ViewIncomeByUser use case
    final userId = 'user123'; // Replace with the desired user ID
    getIncomesByUser.call(userId: userId).then((result) {
      result.fold(
        (failure) => print('Failed to fetch incomes by user: $failure'),
        (incomes) {
          print('Incomes for user $userId:');
          incomes.forEach((income) {
            print('ID: ${income.id}');
            print('User ID: ${income.userId}');
            print('Amount: ${income.amount}');
            print('Date: ${income.date}');
            print('Time: ${income.time}');
            print('Note: ${income.note}');
            print('Category ID: ${income.id}');
            print('------------------------');
          });
        },
      );
    });

    // Test the UpdateIncome use case
    // Replace with the Income to be updated
    IncomeEntity updatedIncome = IncomeEntity(
      id: 'income123',
      userId: 'user123',
      amount: 60.0,
      date: DateTime.now(),
      time: TimeOfDay.now(),
      note: 'Updated income note',
      category: predefinedIncomeCategories[1],
    );

    updateIncome.call(income: updatedIncome).then((result) {
      result.fold(
        (failure) => print('Failed to update income: $failure'),
        (_) => print('Income updated successfully'),
      );
    });

    // Test the DeleteIncome use case
    String incomeId =
        'income123'; // Replace with the ID of the income to be deleted

    deleteIncome.call(incomeId).then((result) {
      result.fold(
        (failure) => print('Failed to delete income: $failure'),
        (_) => print('Income deleted successfully'),
      );
    });
  });
}
