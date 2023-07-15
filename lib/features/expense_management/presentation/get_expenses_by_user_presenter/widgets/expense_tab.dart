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
  // List<Widget> tiles = [];
  Map<String, List<Widget>> tilesByDate = {};

  void displayExpenses() {
    // List<Widget> expenseTiles = [];
    Map<String, List<Widget>> groupedTiles = {};

    for (var expense in expenses) {
      // expenseTiles.add(
      //   ExpenseTile(
      //       id: expense.id,
      //       userId: expense.userId,
      //       amount: expense.amount,
      //       categoryId: expense.categoryId,
      //       date: expense.date,
      //       note: expense.note,
      //       time: expense.time),
      // );

      String date =
          expense.date; // Assuming `date` is a string in your ExpenseModel

      if (groupedTiles.containsKey(date)) {
        groupedTiles[date]!.add(
          ExpenseTile(
            id: expense.id,
            userId: expense.userId,
            amount: expense.amount,
            categoryId: expense.categoryId,
            date: expense.date,
            note: expense.note,
            time: expense.time,
          ),
        );
      } else {
        groupedTiles[date] = [
          ExpenseTile(
            id: expense.id,
            userId: expense.userId,
            amount: expense.amount,
            categoryId: expense.categoryId,
            date: expense.date,
            note: expense.note,
            time: expense.time,
          ),
        ];
      }
    }

    // setState(() {
    //   tiles = expenseTiles;
    // });

    setState(() {
      tilesByDate = groupedTiles;
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
        // Expanded(
        //   child: ListView(
        //     children: tiles,
        //   ),
        // ),

        Expanded(
          child: ListView.builder(
            itemCount: tilesByDate.length,
            itemBuilder: (context, index) {
              String date = tilesByDate.keys.elementAt(index);
              List<Widget> tilesForDate = tilesByDate[date]!;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: tilesForDate,
                  ),
                ],
              );
            },
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
