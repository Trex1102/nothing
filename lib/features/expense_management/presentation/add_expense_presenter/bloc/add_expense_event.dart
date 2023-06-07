part of 'add_expense_bloc.dart';

abstract class AddExpenseEvent extends Equatable {
  const AddExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpenseButtonPressed extends AddExpenseEvent {
  final ExpenseEntity expense;

  const AddExpenseButtonPressed({required this.expense});

  @override
  List<Object> get props => [expense];
}
