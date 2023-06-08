part of 'add_expense_bloc.dart';

enum AddExpenseStatus { initial, success, failure }

class AddExpenseState extends Equatable {
  const AddExpenseState({
    this.status = AddExpenseStatus.initial,
  });

  final AddExpenseStatus status;

  AddExpenseState copyWith({
    AddExpenseStatus? status,
    
  }) {
    return AddExpenseState(
      status: status ?? this.status
    );
  }



  @override
  String toString() => 'AddExpenseState { status: $status }';

  @override
  List<Object> get props => [status];

}