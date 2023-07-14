import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';
import 'package:nothing/features/common/presentation/widgets/welcome.dart';
import 'package:nothing/features/expense_management/data/models/expense_model.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_list.dart';

import '../../../../common/presentation/widgets/datemanagement.dart';

class ExpenseTab extends StatefulWidget {
  @override
  _ExpenseTabState createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  List<ExpenseModel> expenses = [];
  List<Widget> tiles = [];
  void displayExpenses() {
    List<Widget> expenseTiles = [];

    for (var expense in expenses) {
      expenseTiles.add(
        ExpenseTile(
            id: expense.id,
            userId: expense.userId,
            amount: expense.amount,
            categoryId: expense.categoryId,
            date: expense.date,
            note: expense.note,
            time: expense.time),
      );
    }

    setState(() {
      tiles = expenseTiles;
    });
  }

  @override
  void initState() {
    super.initState();
    displayExpenses();
  }

// }
// class ExpenseTab extends StatelessWidget {
  // DateManagement date = DateManagement();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Welcome(),
        DailyExpense(),
        DateManagement(),
        // Container(
        //   margin: EdgeInsets.only(left: 22),
        //   alignment: AlignmentDirectional.topStart,
        //   child: Row(
        //     children: [
        //       Text(
        //         //date.getToday(),
        //        DateManagement.getToday(),
        //         style: CustomTextStyle.defaultTextStyle,
        //       ),
        //        IconButton(
        //     icon: Icon(Icons.calendar_month_rounded),
        //     onPressed: () => _selectDate(context),
        //   ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: ListView(
            children: tiles,
          ),
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
