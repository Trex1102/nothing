import 'package:flutter/material.dart';
import 'package:nothing/core/test/delete_expense_bloc_test.dart';
import 'package:nothing/features/statistics/presentation/pages/statistics_screen.dart';
import 'package:nothing/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import 'package:nothing/features/user_profile/presentation/widgets/user_profile_form.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  // final PageController pageController;

  CustomBottomNavBar({
    required this.currentIndex,
    //required this.pageController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.format_list_bulleted,
            size: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bar_chart,
            size: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            size: 35,
          ),
          label: '',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 255, 191, 0),
      unselectedItemColor: Colors.black, // Color for the selected tab's icon
    );
  }
}
