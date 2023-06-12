import 'package:flutter/material.dart';

class HomepageUpperNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Expense'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: TabBarView(
          children: [ExpenseTab(), IncomeTab()],
        ),
      ),
    );
  }
}

class ExpenseTab extends StatelessWidget {
  const ExpenseTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with your expense content
    return const Center(
      child: Text('Expense Tab Content'),
    );
  }
}

class IncomeTab extends StatelessWidget {
  const IncomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with your income content
    return const Center(
      child: Text('Income Tab Content'),
    );
  }
}
