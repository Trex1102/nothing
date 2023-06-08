import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/expense_management/domain/usecases/delete_expense.dart';

part 'delete_expense_event.dart';
part 'delete_expense_state.dart';

class DeleteExpenseBloc extends Bloc<DeleteExpenseEvent, DeleteExpenseState> {
  final DeleteExpense deleteExpense;

  DeleteExpenseBloc({required this.deleteExpense})
      : super(const DeleteExpenseState()) {
    on<DeleteExpenseButtonPressed>((event, emit) async {
      await deleteExpenseButtonPressed(event, emit);
    });
  }

  Future<void> deleteExpenseButtonPressed(
    DeleteExpenseButtonPressed event,
    Emitter<DeleteExpenseState> emit,
  ) async {

    try {
      final expenseId = event.expenseId;

      final result = await deleteExpense.call(expenseId);

      result.fold(
        (failure) => emit(state.copyWith(status: DeleteExpenseStatus.failure)),
        (_) => emit(state.copyWith(status: DeleteExpenseStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: DeleteExpenseStatus.failure));
    }
  }
}
