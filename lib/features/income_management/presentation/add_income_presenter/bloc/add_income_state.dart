part of 'add_income_bloc.dart';

enum AddIncomeStatus { initial, success, failure }

class AddIncomeState extends Equatable {
  const AddIncomeState({
    this.status = AddIncomeStatus.initial,
  });

  final AddIncomeStatus status;

  AddIncomeState copyWith({
    AddIncomeStatus? status,
  }) {
    return AddIncomeState(status: status ?? this.status);
  }

  @override
  String toString() => 'AddIncomeState { status: $status }';

  @override
  List<Object> get props => [status];
}
