part of 'delete_expense_bloc.dart';

enum DeleteExpenseStatus { initial, success, failure }

class DeleteExpenseState extends Equatable {
  const DeleteExpenseState({
    this.status = DeleteExpenseStatus.initial,
  });

  final DeleteExpenseStatus status;

  DeleteExpenseState copyWith({
    DeleteExpenseStatus? status,
  }) {
    return DeleteExpenseState(
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'DeleteExpenseState { status: $status }';

  @override
  List<Object?> get props => [status];
}
