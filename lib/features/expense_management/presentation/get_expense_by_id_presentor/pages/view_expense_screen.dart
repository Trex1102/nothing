import 'package:flutter/material.dart';
import '../widgets/expense_details.dart';
import '../widgets/upper_navbar.dart';

class ExpenseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          //color: Colors.blue,
          image: DecorationImage(
            image: AssetImage("assets/images/view_expense.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: [
            UpperNavbar(),
            ShowDate(),
            Expanded(child: ExpenseDetails()),
          ],
        ),
      ),
    );
  }
}
