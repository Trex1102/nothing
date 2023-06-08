part of 'delete_expense_bloc.dart';

abstract class DeleteExpenseEvent extends Equatable {
  const DeleteExpenseEvent();

  @override
  List<Object?> get props => [];
}

class DeleteExpenseButtonPressed extends DeleteExpenseEvent {
  final String expenseId;

  const DeleteExpenseButtonPressed({required this.expenseId});

  @override
  List<Object?> get props => [expenseId];
}
