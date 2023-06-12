import 'package:flutter/material.dart';
import 'package:nothing/features/expense_management/presentation/add_expense_presenter/pages/add_expense_screen.dart';
import 'package:nothing/features/homepage/presentation/pages/expense_screen.dart';

class UpperNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomepageExpenseScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpenseScreen()),
                    );
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
