import 'package:nothing/features/expense_management/domain/entities/category_entity.dart';
import '/core/error/failure.dart';
import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateExpense {
  final ExpenseRepository repository;

  CreateExpense(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required double amount,
    required DateTime date,
    required TimeOfDay time,
    required String note,
    required WeatherType weather,
    required CategoryEntity category,
  }) async {
    final uuid = Uuid();
    final expense = ExpenseEntity(
      id: uuid.v4(), // Generate or assign a unique ID
      userId: userId,
      amount: amount,
      date: date,
      time: time,
      note: note,
      weather: weather,
      category: category,
    );

    await repository.createExpense(expense);
    return const Right(null);
  }
}
