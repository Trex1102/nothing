import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/income_management/domain/entities/income_entity.dart';
import 'package:nothing/features/income_management/domain/usecases/create_income.dart';

part 'add_income_event.dart';
part 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  final CreateIncome createIncome;

  AddIncomeBloc({required this.createIncome}) : super(AddIncomeInitial());

  Stream<AddIncomeState> mapEventToState(
    AddIncomeEvent event,
  ) async* {
    if (event is AddIncomeButtonPressed) {
      yield AddIncomeLoading();
      try {
        final userId = event.income.userId;
        final amount = event.income.amount;
        final date = event.income.date;
        final time = event.income.time;
        final note = event.income.note;
        final category = event.income.category;

        final result = await createIncome.call(
          userId: userId,
          amount: amount,
          date: date,
          time: time,
          note: note,
          category: category,
        );

        yield result.fold(
          (failure) => const AddIncomeFailure(error: 'Failed to create income.'),
          (_) => AddIncomeSuccess(),
        );
      } catch (e) {
        yield const AddIncomeFailure(error: 'Failed to create income.');
      }
    }
  }
}
