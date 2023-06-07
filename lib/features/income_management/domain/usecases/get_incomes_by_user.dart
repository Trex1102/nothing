import 'package:dartz/dartz.dart';
import 'package:nothing/core/error/failure.dart';
import 'package:nothing/features/income_management/domain/entities/income_entity.dart';
import 'package:nothing/features/income_management/domain/repositories/income_repository.dart';

class GetIncomesByUser {
  final IncomeRepository repository;

  GetIncomesByUser(this.repository);

  Future<Either<Failure, List<IncomeEntity>>> call({required String userId}) async {
    try {
      final incomes = await repository.getIncomesByUser(userId);
      return Right(incomes);
    } catch (e) {
      return Left(DatabaseFailure("Income Fetch Failed")); // Replace with appropriate Failure object
    }
  }
}

