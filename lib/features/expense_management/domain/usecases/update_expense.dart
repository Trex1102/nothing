import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/expense_management/domain/entities/expense_entity.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';

class UpdateExpense {
  final ExpenseRepository repository;

  UpdateExpense(this.repository);

  Future<Either<Failure, void>> call({required ExpenseEntity expense}) async {
    try {
      await repository.updateExpense(expense);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Update Expense Failed")); // Replace with appropriate Failure object
    }
  }
}
