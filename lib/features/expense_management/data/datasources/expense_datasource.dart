import '../../data/models/expense_model.dart';

abstract class ExpenseDataSource {
  Future<void> createExpense(ExpenseModel expense);
  Future<List<ExpenseModel>> getExpensesByUser(String userId);
  Future<void> updateExpense(ExpenseModel expense);
  Future<void> deleteExpense(String id);
  Future<ExpenseModel> getExpenseById(String expenseId);
}
