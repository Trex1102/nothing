import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'custom_text_styles.dart';

// class DateManagement extends StatelessWidget {
//   const DateManagement({super.key});

//   String getToday() {
//     final DateTime today = DateTime.now();
//     String formattedDate = DateFormat('d MMMM, y').format(today);
//     return formattedDate;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

class DateManagement extends StatefulWidget {
  @override
  _DateManagementState createState() => _DateManagementState();

  static String getToday() {
    final DateTime today = DateTime.now();
    String formattedDate = DateFormat('d MMMM, y').format(today);
    return formattedDate;
  }

  static String getSelectedDate(DateTime selectedDate) {
    String formattedDate = DateFormat('d MMMM, y').format(selectedDate);
    return formattedDate;
  }
}

class _DateManagementState extends State<DateManagement> {
  DateTime selectedDate = DateTime.now();

  String getSelectedDate() {
    String formattedDate = DateFormat('d MMMM, y').format(selectedDate);
    return formattedDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22),
      alignment: AlignmentDirectional.topStart,
      child: Row(
        children: [
          Text(
            getSelectedDate(),
            style: CustomTextStyle.defaultTextStyle,
          ),
          IconButton(
            icon: Icon(Icons.calendar_month_rounded),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
