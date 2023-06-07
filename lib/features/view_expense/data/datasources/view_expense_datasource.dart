import '../../domain/entities/view_expense_entity.dart';

abstract class ViewExpenseDataSource {
  Future<List<ViewExpenseEntity>> getExpenses();
}
