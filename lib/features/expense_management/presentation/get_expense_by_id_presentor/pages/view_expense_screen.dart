import 'package:flutter/material.dart';
import '../widgets/expense_details.dart';
import '../widgets/upper_navbar.dart';

class ExpenseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              //color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("assets/images/view_expense.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Column(
          //   children: [
          //     UpperNavbar(),
          //     ShowDate(),
          //     ExpenseDetails(),
          //   ],
          // ),

          Positioned(
            child: UpperNavbar(),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: ShowDate(),
          ),
          Positioned(
            child: ExpenseDetails(),
          ),
        ],
      ),
    );
  }
}
