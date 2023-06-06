import 'package:flutter/foundation.dart';
import '/core/error/failure.dart';
import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

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
    required Category category,
  }) async {
    final expense = ExpenseEntity(
      id: '', // Generate or assign a unique ID
      userId: userId,
      amount: amount,
      date: date,
      time: time,
      note: note,
      weather: weather,
      category: category,
    );

    return repository.createExpense(expense);
  }
}
