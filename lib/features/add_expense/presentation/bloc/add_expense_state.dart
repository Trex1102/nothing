part of 'add_expense_bloc.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();  

  @override
  List<Object> get props => [];
}
class AddExpenseInitial extends AddExpenseState {}
