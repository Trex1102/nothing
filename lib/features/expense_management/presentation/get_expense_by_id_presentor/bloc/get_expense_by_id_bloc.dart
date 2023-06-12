import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/get_expense_by_id.dart';

part 'get_expense_by_id_event.dart';
part 'get_expense_by_id_state.dart';

class GetExpenseByIdBloc
    extends Bloc<GetExpenseByIdEvent, GetExpenseByIdState> {
  final GetExpenseById getExpenseById;

  GetExpenseByIdBloc({required this.getExpenseById})
      : super(const GetExpenseByIdState()) {
    on<GetExpenseButtonPressed>((event, emit) async {
      await getExpenseButtonPressed(event, emit);
    });
  }

  Future<void> getExpenseButtonPressed(
    GetExpenseButtonPressed event,
    Emitter<GetExpenseByIdState> emit,
  ) async {
    try {
      final expenseId = event.expenseId;

      final result = await getExpenseById.call(expenseId);

      result.fold(
        (failure) => emit(state.copyWith(status: GetExpenseByIdStatus.failure)),
        (_) => emit(state.copyWith(status: GetExpenseByIdStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: GetExpenseByIdStatus.failure));
    }
  }
}
