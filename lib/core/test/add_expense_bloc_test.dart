import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nothing/features/expense_management/presentation/add_expense_presenter/bloc/add_expense_bloc.dart';
import 'package:nothing/features/expense_management/domain/usecases/create_expense.dart';

import 'package:nothing/core/error/failure.dart';

import '../../features/expense_management/domain/entities/category_entity.dart' as category_entity;
import 'package:nothing/features/expense_management/domain/entities/category_entity.dart' as PackageCategoryEntity;
import '../../features/expense_management/domain/entities/expense_entity.dart';

class MockCreateExpense extends Mock implements CreateExpense {}

void main() {
  group('AddExpenseBloc', () {
    late AddExpenseBloc addExpenseBloc;
    late MockCreateExpense mockCreateExpense;

    setUp(() {
      mockCreateExpense = MockCreateExpense();
      addExpenseBloc = AddExpenseBloc(createExpense: mockCreateExpense);
    });

    test('emits [AddExpenseLoading, AddExpenseSuccess] when expense creation is successful', () async {
      // Arrange
      final userId = 'user123';
      final amount = 50.0;
      final date = DateTime.now();
      final time = TimeOfDay.now();
      final note = 'Expense note';
      final weather = WeatherType.sunny;
      final category = category_entity.predefinedCategories[0];

      final expense = ExpenseEntity(
        id: '123',
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        weather: weather,
        category: category,
      );

      when(mockCreateExpense.call(
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        weather: weather,
        category: category,
      )).thenAnswer((_) async => Right(null));

      // Act
      addExpenseBloc.add(AddExpenseButtonPressed(expense: expense));

      // Assert
      expectLater(
        addExpenseBloc.stream,
        emitsInOrder([AddExpenseLoading(), AddExpenseSuccess()]),
      );
    });

    test('emits [AddExpenseLoading, AddExpenseFailure] when expense creation fails', () async {
      // Arrange
      final userId = 'user123';
      final amount = 50.0;
      final date = DateTime.now();
      final time = TimeOfDay.now();
      final note = 'Expense note';
      final weather = WeatherType.sunny;
      final category = category_entity.predefinedCategories[0];
      final expense = ExpenseEntity(
        id: '123',
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        weather: weather,
        category: category,
      );

      when(mockCreateExpense.call(
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        weather: weather,
        category: category,
      )).thenAnswer((_) async => Left(DatabaseFailure("Failed to create expense.")));

      // Act
      addExpenseBloc.add(AddExpenseButtonPressed(expense: expense));

      // Assert
      expectLater(
        addExpenseBloc.stream,
        emitsInOrder([AddExpenseLoading(), const AddExpenseFailure(error: 'Failed to create expense.')]),
      );
    });

    tearDown(() {
      addExpenseBloc.close();
    });
  });
}
