import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/bottom_navbar.dart';
import '../../../expense_management/presentation/add_expense_presenter/pages/add_expense_screen.dart';
import '../../../expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_tab.dart';
import '../../../income_management/presentation/get_income_by_user_id_presentor/widgets/income_tab.dart';
import '../../../statistics/presentation/pages/statistics_screen.dart';
import '../../../user_profile/presentation/widgets/user_profile_form.dart';
import '../widgets/upper_navbar.dart';

class HomepageIncomeScreen extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          //appBar: setAppBar(),
          body: Column(
            children: [
              setAppBar(),
              Expanded(
                child: TabBarView(
                  children: [ExpenseTab(), IncomeTab()],
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddIncomeScreen()),
              // );
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
              } else if (index == 2) {
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => UserProfilePage(userRepository: null,)),
                // );
              }
            },
          ),

          //   bottomNavigationBar: CustomBottomNavBar(
          //     currentIndex: 0,
          //     pageController: pageController,
          //     onTap: (int index) {
          //       pageController.animateToPage(
          //         index,
          //         duration: Duration(milliseconds: 300),
          //         curve: Curves.ease,
          //       );
          //     },
          //   ),
          // ),
        ));
  }
}
