import '../entities/view_expense_entity.dart';
import '../repositories/view_expense_repository.dart';

class GetExpensesUseCase {
  final ViewExpenseRepository expenseRepository;

  GetExpensesUseCase({required this.expenseRepository});

  Future<List<ViewExpenseEntity>> execute() {
    return expenseRepository.getExpenses();
  }
}
