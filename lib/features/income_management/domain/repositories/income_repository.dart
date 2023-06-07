import '../entities/income_entity.dart';

abstract class IncomeRepository {
  Future<void> createIncome(IncomeEntity income);
  Future<List<IncomeEntity>> getIncomesByUser(String userId);
  Future<void> updateIncome(IncomeEntity income);
  Future<void> deleteIncome(String incomeId);
}
