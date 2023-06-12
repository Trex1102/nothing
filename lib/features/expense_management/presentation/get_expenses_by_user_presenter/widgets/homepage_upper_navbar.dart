import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_list.dart';
import 'package:nothing/features/income_management/presentation/get_income_by_id_presentor/widgets/income_tab.dart';
import 'package:nothing/features/statistics/presentation/pages/statistics_screen.dart';

import '../../../../common/presentation/widgets/bottom_navbar.dart';
//import '../../../../statistics/presentation/pages/statistics_screen.dart';
import 'expense_tab.dart';

class HomepageUpperNavbar extends StatelessWidget {
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
          // backgroundColor: Color.fromARGB(255, 217, 217, 217),
          backgroundColor: Colors.white,
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
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 0,
          onTap: (int index) {
            if (index == 1) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatisticsScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
