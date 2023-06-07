import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_income_event.dart';
part 'add_income_state.dart';

class AddIncomeBloc extends Bloc<AddIncomeEvent, AddIncomeState> {
  AddIncomeBloc() : super(AddIncomeInitial()) {
    on<AddIncomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
