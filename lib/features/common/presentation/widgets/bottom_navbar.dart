import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            size: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart, size: 35),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 35,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor:
          Color.fromARGB(255, 255, 191, 0), // Color for the selected tab's icon
    );
  }
}
