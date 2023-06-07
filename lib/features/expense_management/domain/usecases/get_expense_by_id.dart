import 'package:dartz/dartz.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/expense_management/domain/entities/expense_entity.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';

class GetExpenseById {
  final ExpenseRepository repository;

  GetExpenseById(this.repository);

  Future<Either<Failure, ExpenseEntity>> call(String expenseId) async {
    try {
      final expense = await repository.getExpenseById(expenseId);
      return Right(expense);
    } catch (e) {
      return Left(DatabaseFailure("Get Expense by ID Failed")); // Replace with appropriate Failure object
    }
  }
}
