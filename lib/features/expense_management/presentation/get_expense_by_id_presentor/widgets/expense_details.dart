import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/presentation/widgets/custom_text_styles.dart';
import 'upper_navbar.dart';

class ShowDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(217, 217, 217, 1),
            ),
            child: Text(
              '6 April, 2023',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(Icons.cloud),
        ],
      ),
    );
  }
}

class ExpenseDetails extends StatelessWidget {
  ExpenseDetails({super.key});

  final customTextStyle = CustomTextStyle();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            "Amount",
                            style: customTextStyle.labelTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            ":",
                            style: customTextStyle.labelTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            " 500",
                            style: CustomTextStyle.defaultTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            "Category",
                            style: customTextStyle.labelTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          ":",
                          style: customTextStyle.labelTextStyle,
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            " cat",
                            style: CustomTextStyle.defaultTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            "Note",
                            style: customTextStyle.labelTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          ":",
                          style: customTextStyle.labelTextStyle,
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            " notee",
                            style: CustomTextStyle.defaultTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            "Day",
                            style: customTextStyle.labelTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          ":",
                          style: customTextStyle.labelTextStyle,
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            " Thursday",
                            style: CustomTextStyle.defaultTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Weather",
                          style: customTextStyle.labelTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          ":",
                          style: customTextStyle.labelTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          " rainy",
                          style: CustomTextStyle.defaultTextStyle,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
