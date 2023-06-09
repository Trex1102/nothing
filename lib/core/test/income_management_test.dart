import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/network/network_info_impl.dart';
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
import '../../core/database/database_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  final database = await DatabaseInitializer.initDatabase();

  Connectivity connectivity = Connectivity();

  // Create an instance of LocalStorage
  IncomeLocalStorage localStorage = IncomeLocalStorage(database);

  // Create an instance of the IncomeDataSource
  IncomeDataSourceImpl incomeDataSource = IncomeDataSourceImpl(localStorage);

  // Create an instance of the NetworkInfo
  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectivity);

  // Create an instance of the IncomeRepository
  IncomeRepository incomeRepository = IncomeRepositoryImpl(
    incomeDataSource: incomeDataSource,
    networkInfo: networkInfo,
  );

  // Create the use cases
  CreateIncome createIncome = CreateIncome(incomeRepository);
  GetIncomesByUser getIncomesByUser = GetIncomesByUser(incomeRepository);
  DeleteIncome deleteIncome = DeleteIncome(incomeRepository);
  UpdateIncome updateIncome = UpdateIncome(incomeRepository);

  // Test the CreateIncome use case
  createIncome
      .call(
    id: '123',
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
