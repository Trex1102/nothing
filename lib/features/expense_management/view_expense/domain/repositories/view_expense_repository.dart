import "../entities/view_expense_entity.dart";

abstract class ViewExpenseRepository {
  Future<List<ViewExpenseEntity>> getExpenses();
}
