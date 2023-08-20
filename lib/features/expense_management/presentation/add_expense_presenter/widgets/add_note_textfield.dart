import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddNoteTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h), // Use screenutil for padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              primarySwatch: Colors.amber, // Set the primary color to amber
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Add Note',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
