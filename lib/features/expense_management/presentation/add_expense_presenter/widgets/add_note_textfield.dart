import 'package:flutter/material.dart';

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddNoteTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
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
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: const Center(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
