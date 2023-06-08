import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../entities/expense_entity.dart';
import '../repositories/expense_repository.dart';

class CreateExpense {
  final ExpenseRepository repository;

  CreateExpense(this.repository);

  Future<Either<Failure, void>> call({
    required String id,
    required String userId,
    required double amount,
    required DateTime date,
    required TimeOfDay time,
    required String note,
    required WeatherType weather,
    required CategoryEntity category,
  }) async {
    //final uuid = Uuid();
    final expense = ExpenseEntity(
      id: id, // Generate or assign a unique ID
      userId: userId,
      amount: amount,
      date: date,
      time: time,
      note: note,
      weather: weather,
      category: category,
    );

    try {
      await repository.createExpense(expense);
      return Right(null); // Return Right indicating success with a null value
    } catch (e) {
      return Left(DatabaseFailure("Failed to create expense.")); // Return Left with a Failure object in case of failure
    }
  }
}
