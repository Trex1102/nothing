import 'package:dartz/dartz.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/income_management/domain/repositories/income_repository.dart';

class DeleteIncome {
  final IncomeRepository repository;

  DeleteIncome(this.repository);

  Future<Either<Failure, void>> call(String incomeId) async {
    try {
      await repository.deleteIncome(incomeId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Income Deletion Failed")); // Replace with appropriate Failure object
    }
  }
}
