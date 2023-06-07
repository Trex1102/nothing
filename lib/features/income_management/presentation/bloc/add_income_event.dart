part of 'add_income_bloc.dart';

abstract class AddIncomeEvent extends Equatable {
  const AddIncomeEvent();

  @override
  List<Object> get props => [];
}

class AddIncomeButtonPressed extends AddIncomeEvent {
  final IncomeEntity income;

  const AddIncomeButtonPressed({required this.income});

  @override
  List<Object> get props => [income];
}
