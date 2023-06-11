// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../../../domain/usecases/get_expense_by_id.dart';

// part 'get_expense_by_id_event.dart';
// part 'get_expense_by_id_state.dart';

// class GetExpenseByIdBloc extends Bloc<String, ExpenseEntity> {
//   final GetExpenseById getExpenseById;

//   GetExpenseByIdBloc({required this.getExpenseById}) : super(ExpenseEntity());

//   @override
//   Stream<ExpenseEntity> mapEventToState(String expenseId) async* {
//     try {
//       final result = await getExpenseById.call(expenseId);

//       result.fold(
//         (failure) {
//           // Handle failure, for example, show an error message
//           // Emit an error state if needed
//         },
//         (expense) {
//           // Handle success, for example, perform necessary operations with the expense data
//           // Emit the received expense data
//           yield expense;
//         },
//       );
//     } catch (e) {
//       // Handle exception, for example, show an error message
//       // Emit an error state if needed
//     }
//   }
// }
