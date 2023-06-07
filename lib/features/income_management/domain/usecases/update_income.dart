import 'package:dartz/dartz.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/income_management/domain/entities/income_entity.dart';
import 'package:nothing/features/income_management/domain/repositories/income_repository.dart';

class UpdateIncome {
  final IncomeRepository repository;

  UpdateIncome(this.repository);

  Future<Either<Failure, void>> call({required IncomeEntity income}) async {
    try {
      await repository.updateIncome(income);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Update Income Failed")); // Replace with appropriate Failure object
    }
  }
}
