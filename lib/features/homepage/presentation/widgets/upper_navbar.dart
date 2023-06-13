import 'package:flutter/material.dart';

Container setAppBar() {
  return Container(
    margin: EdgeInsets.only(top: 30),
    child: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: TabBar(
        tabs: [
          Tab(text: 'Expense'),
          Tab(text: 'Income'),
        ],
      ),
    ),
  );
}
