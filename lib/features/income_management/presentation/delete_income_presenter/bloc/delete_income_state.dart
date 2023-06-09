part of 'delete_income_bloc.dart';

enum DeleteIncomeStatus { initial, success, failure }

class DeleteIncomeState extends Equatable {
  const DeleteIncomeState({
    this.status = DeleteIncomeStatus.initial,
  });

  final DeleteIncomeStatus status;

  DeleteIncomeState copyWith({
    DeleteIncomeStatus? status,
  }) {
    return DeleteIncomeState(
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'DeleteIncomeState { status: $status }';

  @override
  List<Object?> get props => [status];
}
