
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
import 'package:nothing/features/add_expense/data/datasources/expense_datasource_impl.dart';
import 'package:nothing/features/add_expense/domain/entities/category_entity.dart';
import 'package:sqflite/sqflite.dart';


import '../../features/add_expense/data/datasources/local_storage.dart';
import '../../features/add_expense/data/repositories/expense_repository_impl.dart';
import '../../features/add_expense/domain/entities/expense_entity.dart';
import '../../features/add_expense/domain/repositories/expense_repository.dart';
import '../../features/add_expense/domain/usecases/create_expense.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

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
  createExpense.call(
    userId: 'user123',
    amount: 50.0,
    date: DateTime.now(),
    time: TimeOfDay.now(),
    note: 'Expense note',
    weather: WeatherType.sunny,
    category: CategoryEntity(id : '1' , name: 'Food', color: 'Blue', icon:  Icons.fastfood),
  ).then((result) {
    result.fold(
      (failure) => print('Expense creation failed: $failure'),
      (voidResult) => print('Expense created successfully'),
    );
  });
}
