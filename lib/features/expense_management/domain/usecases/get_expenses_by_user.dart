import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/expense_management/domain/entities/expense_entity.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';

class GetExpensesByUser {
  final ExpenseRepository repository;

  GetExpensesByUser(this.repository);

  Future<Either<Failure, List<ExpenseEntity>>> call({required String userId}) async {
    try {
      final expenses = await repository.getExpensesByUser(userId);
      return Right(expenses);
    } catch (e) {
      return Left(DatabaseFailure("Expense Fetch Failed")); // Replace with appropriate Failure object
    }
  }
}

