import '../datasources/expense_datasource.dart';
import '../models/expense_model.dart';
import '/../../../core/error/exceptions.dart';
import '../../data/datasources/local_storage.dart';

class ExpenseDataSourceImpl implements ExpenseDataSource {
  final LocalStorage localStorage;

  ExpenseDataSourceImpl(this.localStorage);

  @override
  Future<void> createExpense(ExpenseModel expense) async {
    try {
      await localStorage.createExpense(expense);
    } catch (e) {
      print('Failed to create expense: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<List<ExpenseModel>> getExpensesByUser(String userId) async {
    try {
      return await localStorage.getExpensesByUser(userId);
    } catch (e) {
      print('Failed to fetch expenses by user: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<void> updateExpense(ExpenseModel expense) async {
    try {
      await localStorage.updateExpense(expense);
    } catch (e) {
      print('Failed to update expense: $e');
      throw DataSourceException();
    }
  }

  @override
  Future<void> deleteExpense(String id) async {
    try {
      await localStorage.deleteExpense(id);
    } catch (e) {
      print('Failed to delete expense: $e');
      throw DataSourceException();
    }
  }
}
