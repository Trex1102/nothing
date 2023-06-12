import 'package:flutter/material.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_list.dart';

class ExpenseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailyExpense(),
        ExpenseTile(),
      ],
    );
    throw UnimplementedError();
  }
}
