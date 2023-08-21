import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the package
import '../widgets/expense_details.dart';


class ExpenseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Edit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp, // Use screenutil to adapt font size
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/view_expense.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 100.h, // Use screenutil to adapt vertical position
            left: 20.w, // Use screenutil to adapt horizontal position
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

void main() {
  runApp(MaterialApp(
    home: ExpenseDetailsPage(),
  ));
}
