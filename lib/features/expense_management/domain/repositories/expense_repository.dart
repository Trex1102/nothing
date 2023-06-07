import '../entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<void> createExpense(ExpenseEntity expense);
  Future<List<ExpenseEntity>> getExpensesByUser(String userId);
  Future<void> updateExpense(ExpenseEntity expense);
  Future<void> deleteExpense(String expenseId);
  Future<ExpenseEntity> getExpenseById(String expenseId);
}
