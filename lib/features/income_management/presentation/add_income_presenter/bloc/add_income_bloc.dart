import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nothing/features/income_management/domain/entities/income_entity.dart';
import 'package:nothing/features/income_management/domain/usecases/create_income.dart';

part 'add_income_event.dart';
part 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  final CreateIncome createIncome;

  AddIncomeBloc({required this.createIncome}) : super(const AddIncomeState()) {
    on<AddIncomeButtonPressed>((event, emit) async {
      await addIncomeButtonPressed(event, emit);
    });
  }

  Future<void> addIncomeButtonPressed(
    AddIncomeButtonPressed event,
    Emitter<AddIncomeState> emit,
  ) async {
    try {
      final id = event.income.id;
      final userId = event.income.userId;
      final amount = event.income.amount;
      final date = event.income.date;
      final time = event.income.time;
      final note = event.income.note;
      final category = event.income.category;

      final result = await createIncome.call(
        id: id,
        userId: userId,
        amount: amount,
        date: date,
        time: time,
        note: note,
        category: category,
      );

      result.fold(
        (failure) => emit(state.copyWith(status: AddIncomeStatus.failure)),
        (_) => emit(state.copyWith(status: AddIncomeStatus.success)),
      );
    } catch (e) {
      emit(state.copyWith(status: AddIncomeStatus.failure));
    }
  }
}
