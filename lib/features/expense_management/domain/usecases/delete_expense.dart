import 'package:dartz/dartz.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/expense_management/domain/repositories/expense_repository.dart';

class DeleteExpense {
  final ExpenseRepository repository;

  DeleteExpense(this.repository);

  Future<Either<Failure, void>> call(String expenseId) async {
    try {
      await repository.deleteExpense(expenseId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Expense Deletion Failed")); // Replace with appropriate Failure object
    }
  }
}
