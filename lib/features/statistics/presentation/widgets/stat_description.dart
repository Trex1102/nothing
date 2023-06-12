import 'package:flutter/material.dart';

class StatisticsDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.blue,
              ),
              Text('Expense1')
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.red,
              ),
              Text('Expense2')
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.pink,
              ),
              Text('Expense3')
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.purple,
              ),
              Text('Expense4')
            ],
          ),
        ],
      ),
    );
  }
}
