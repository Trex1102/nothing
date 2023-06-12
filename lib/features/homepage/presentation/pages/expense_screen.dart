import 'package:flutter/material.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_list.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/homepage_upper_navbar.dart';

class HomepageExpenseScreen extends StatelessWidget {
  const HomepageExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            HomepageUpperNavbar(),
            //DailyExpense(),
            //ExpenseTile(),
          ],
        ),
      ),
    );
  }
}
