part of 'get_expense_by_id_bloc.dart';

enum GetExpenseByIdStatus { initial, success, failure }

class GetExpenseByIdState extends Equatable {
  final GetExpenseByIdStatus status;
  final ExpenseEntity? expense;
  // const GetExpenseByIdState({
  //   required this.status,
  //   required this.expense,
  // });

  const GetExpenseByIdState({
    this.status = GetExpenseByIdStatus.initial,
    this.expense = null, // Set initial expense value as null
  });

  // GetExpenseByIdState copyWith({
  //   GetExpenseByIdStatus? status,
  // }) {
  //   return GetExpenseByIdState(status: status ?? this.status);
  // }

  GetExpenseByIdState copyWith({
    GetExpenseByIdStatus? status,
    ExpenseEntity? expense,
  }) {
    return GetExpenseByIdState(
      status: status ?? this.status,
      expense: expense ?? this.expense,
    );
  }

  @override
  String toString() => 'GetExpenseByIdState { status: $status }';

  @override
  List<Object?> get props => [status, expense];
}
