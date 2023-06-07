import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/expense_management/domain/entities/expense_entity.dart';
import 'package:nothing/features/expense_management/domain/usecases/create_expense.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final CreateExpense createExpense;

  AddExpenseBloc({required this.createExpense}) : super(AddExpenseInitial());

  Stream<AddExpenseState> mapEventToState(
    AddExpenseEvent event,
  ) async* {
    if (event is AddExpenseButtonPressed) {
      yield AddExpenseLoading();
      try {
        final userId = event.expense.userId;
        final amount = event.expense.amount;
        final date = event.expense.date;
        final time = event.expense.time;
        final note = event.expense.note;
        final weather = event.expense.weather;
        final category = event.expense.category;

        final result = await createExpense.call(
          userId: userId,
          amount: amount,
          date: date,
          time: time,
          note: note,
          weather: weather,
          category: category,
        );

        yield result.fold(
          (failure) => const AddExpenseFailure(error: 'Failed to create expense.'),
          (_) => AddExpenseSuccess(),
        );
      } catch (e) {
        yield const AddExpenseFailure(error: 'Failed to create expense.');
      }
    }
  }
}
