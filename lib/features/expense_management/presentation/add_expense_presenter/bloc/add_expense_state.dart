part of 'add_expense_bloc.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();

  @override
  List<Object> get props => [];
}

class AddExpenseInitial extends AddExpenseState {}

class AddExpenseLoading extends AddExpenseState {}

class AddExpenseSuccess extends AddExpenseState {}

class AddExpenseFailure extends AddExpenseState {
  final String error;

  const AddExpenseFailure({required this.error});

  @override
  List<Object> get props => [error];
}
