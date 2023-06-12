part of 'get_expense_by_id_bloc.dart';

enum GetExpenseByIdStatus { initial, success, failure }

class GetExpenseByIdState extends Equatable {
  const GetExpenseByIdState({
    this.status = GetExpenseByIdStatus.initial,
  });

  final GetExpenseByIdStatus status;

  GetExpenseByIdState copyWith({
    GetExpenseByIdStatus? status,
  }) {
    return GetExpenseByIdState(status: status ?? this.status);
  }

  @override
  String toString() => 'GetExpenseByIdState { status: $status }';

  @override
  List<Object> get props => [status];
}
