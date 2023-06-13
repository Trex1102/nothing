import 'package:flutter/material.dart';
import 'package:nothing/features/common/presentation/widgets/custom_text_styles.dart';

import '../../../common/presentation/widgets/bottom_navbar.dart';
import '../../../homepage/presentation/pages/expense_screen.dart';
import '../widgets/pie_chart.dart';
import '../widgets/stat_description.dart';

class StatisticsScreen extends StatelessWidget {
  final customStyle = CustomTextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 0),
                      child: Text(
                        '<date>',
                        style: customStyle.labelTextStyle,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 0),
                        child: Icon(
                          Icons.tune,
                          size: 35,
                        )),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                height: 350,
                child: Statistics(),
              ),
              StatisticsDescription(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 1,
          onTap: (int index) {
            if (index == 0) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomepageExpenseScreen()),
              );
            }
          },
        ));
  }
}
