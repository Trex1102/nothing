import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/income_management/domain/usecases/delete_income.dart';

part 'delete_income_event.dart';
part 'delete_income_state.dart';

class DeleteIncomeBloc extends Bloc<DeleteIncomeEvent, DeleteIncomeState> {
  final DeleteIncome deleteIncome;

  DeleteIncomeBloc({required this.deleteIncome})
      : super(const DeleteIncomeState()) {
    on<DeleteIncomeButtonPressed>((event, emit) async {
      await deleteIncomeButtonPressed(event, emit);
    });
  }

  Future<void> deleteIncomeButtonPressed(
    DeleteIncomeButtonPressed event,
    Emitter<DeleteIncomeState> emit,
  ) async {

    try {
      final incomeId = event.incomeId;

      final result = await deleteIncome.call(incomeId);

      result.fold(
        (failure) => emit(state.copyWith(status: DeleteIncomeStatus.failure)),
        (_) => emit(state.copyWith(status: DeleteIncomeStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: DeleteIncomeStatus.failure));
    }
  }
}
