import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_tab.dart';

import 'income_tab.dart';

class IncomeHomepageUpperNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.arrow_back),
              // ),
              Icon(
                Icons.account_balance,
                color: Color.fromARGB(255, 217, 191, 0),
              ),
              Text('FinTracker')
            ],
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelStyle: CustomTextStyle.defaultTextStyle,
            indicator: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black), // provides to left side
                bottom: BorderSide(color: Colors.black), // for bottom side
              ),
            ),
            tabs: [
              Tab(
                text: 'Expense',
              ),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: TabBarView(
          children: [ExpenseTab(), IncomeTab()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 255, 191, 0),
        ),
      ),
    );
  }
}
