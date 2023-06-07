import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_expense_event.dart';
part 'view_expense_state.dart';

class ViewExpenseBloc extends Bloc<ViewExpenseEvent, ViewExpenseState> {
  ViewExpenseBloc() : super(ViewExpenseInitial()) {
    on<ViewExpenseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
