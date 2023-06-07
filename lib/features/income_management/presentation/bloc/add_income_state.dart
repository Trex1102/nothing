part of 'add_income_bloc.dart';

abstract class AddIncomeState extends Equatable {
  const AddIncomeState();

  @override
  List<Object> get props => [];
}

class AddIncomeInitial extends AddIncomeState {}

class AddIncomeLoading extends AddIncomeState {}

class AddIncomeSuccess extends AddIncomeState {}

class AddIncomeFailure extends AddIncomeState {
  final String error;

  const AddIncomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
