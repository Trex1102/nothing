part of 'delete_income_bloc.dart';

abstract class DeleteIncomeEvent extends Equatable {
  const DeleteIncomeEvent();

  @override
  List<Object?> get props => [];
}

class DeleteIncomeButtonPressed extends DeleteIncomeEvent {
  final String incomeId;

  const DeleteIncomeButtonPressed({required this.incomeId});

  @override
  List<Object?> get props => [incomeId];
}
