import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';
import 'package:nothing/features/expense_management/data/models/expense_model.dart';

import '../../../../statistics/presentation/pages/statistics_screen.dart';
import '../../get_expense_by_id_presentor/pages/view_expense_screen.dart';

class DailyExpense extends StatelessWidget {
  final customTextStyle = CustomTextStyle();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Expanded(
        child: Column(children: [
          Text(
            "Today's Expense",
            style: customTextStyle.mediumTextStyle,
          ),
          Text('৳000', style: customTextStyle.largeTextStyle),
        ]),
      ),
    );
  }
}

class ExpenseTile extends StatelessWidget {
  final String id;
  final String userId;
  final double amount;
  final String date;
  final String time;
  final String note;
  final String categoryId;

  const ExpenseTile({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpenseDetailsPage(),
          ),
        );
      },
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 217, 217, 217),
        ),
        child: Row(
          children: [
            Container(
              width: 55, // Width of the icon
              // Placeholder color
              child: const Icon(
                Icons.emoji_transportation_rounded,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Amount',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Show Time',
                  style: TextStyle(fontSize: 14),
                ),
                Icon(
                  Icons.cloud,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
