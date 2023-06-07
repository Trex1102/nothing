import '../models/income_model.dart';

abstract class IncomeDataSource {
  Future<void> createIncome(IncomeModel income);
  Future<List<IncomeModel>> getIncomesByUser(String userId);
  Future<void> updateIncome(IncomeModel income);
  Future<void> deleteIncome(String id);
}
