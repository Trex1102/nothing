import '../datasources/income_datasource.dart';
import '../models/income_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../data/datasources/local_storage.dart';

class IncomeDataSourceImpl implements IncomeDataSource {
  final IncomeLocalStorage localStorage;

  IncomeDataSourceImpl(this.localStorage);

  @override
  Future<void> createIncome(IncomeModel income) async {
    try {
      await localStorage.createIncome(income);
    } catch (e) {
      print('Failed to create income: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<List<IncomeModel>> getIncomesByUser(String userId) async {
    try {
      return await localStorage.getIncomesByUser(userId);
    } catch (e) {
      print('Failed to fetch incomes by user: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<void> updateIncome(IncomeModel income) async {
    try {
      await localStorage.updateIncome(income);
    } catch (e) {
      print('Failed to update income: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<void> deleteIncome(String id) async {
    try {
      await localStorage.deleteIncome(id);
    } catch (e) {
      print('Failed to delete income: $e');
      throw DataSourceException();
    }
  }
}
