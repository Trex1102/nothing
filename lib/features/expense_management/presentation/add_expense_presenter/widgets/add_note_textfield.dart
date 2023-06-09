import 'package:flutter/material.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddNoteTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Add a Note',
                  style: TextStyle(fontSize: 16, fontFamily: 'MPlusRounded1C', color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
