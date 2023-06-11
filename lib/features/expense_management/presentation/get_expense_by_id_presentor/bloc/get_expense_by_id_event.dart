part of 'get_expense_by_id_bloc.dart';

abstract class GetExpenseByIdEvent extends Equatable {
  const GetExpenseByIdEvent();

  @override
  List<Object> get props => [];
}

class GetExpenseButtonPressed extends GetExpenseByIdEvent {
  final String expenseId;

  const GetExpenseButtonPressed({required this.expenseId});

  @override
  List<Object> get props => [expenseId];
}
