import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';
import 'package:nothing/features/common/presentation/widgets/welcome.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_list.dart';

class ExpenseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Welcome(),
        DailyExpense(),
        Container(
          margin: EdgeInsets.only(left: 22),
          alignment: AlignmentDirectional.topStart,
          child: Row(
            children: [
              Text(
                'Today',
                style: CustomTextStyle.defaultTextStyle,
              ),
              Icon(Icons.calendar_month_rounded),
            ],
          ),
        ),
        ExpenseTile(),
      ],
    );
  }
}
