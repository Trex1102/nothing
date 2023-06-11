import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nothing/features/expense_management/presentation/add_expense_presenter/pages/add_expense_screen.dart';
import 'package:nothing/features/expense_management/presentation/get_expenses_by_user_presenter/widgets/expense_homepage.dart';

class CustomTextStyle {
  static TextStyle defaultTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
  );
}

class LabelTextStyle {
  static TextStyle defaultTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
    fontWeight: FontWeight.bold,
  );
}

class UpperNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomepageUpperNavbar()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpenseScreen()),
                    );
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
