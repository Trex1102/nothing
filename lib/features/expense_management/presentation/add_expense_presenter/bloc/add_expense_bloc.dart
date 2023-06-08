import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/expense_management/domain/entities/expense_entity.dart';
import 'package:nothing/features/expense_management/domain/usecases/create_expense.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  final CreateExpense createExpense;

  AddExpenseBloc({required this.createExpense})
      : super(const AddExpenseState()) {
    on<AddExpenseButtonPressed>((event, emit) async {
      await addExpenseButtonPressed(event, emit);
    });
  }

  Future <void> addExpenseButtonPressed(
    AddExpenseButtonPressed event,
    Emitter<AddExpenseState> emit,
  ) async {
    emit(state.copyWith(status: AddExpenseStatus.loading));

    try {
      final id = event.expense.id;
      final userId = event.expense.userId;
      final amount = event.expense.amount;
      final date = event.expense.date;
      final time = event.expense.time;
      final note = event.expense.note;
      final weather = event.expense.weather;
      final category = event.expense.category;

      final result = await createExpense.call(
        id: id,
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        weather: weather,
        category: category,
      );


      result.fold(
        (failure) => emit(state.copyWith(status: AddExpenseStatus.failure)),
        (_) => emit(state.copyWith(status: AddExpenseStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: AddExpenseStatus.failure));
    }
  }
}
