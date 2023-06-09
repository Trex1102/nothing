import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/expense_management/presentation/add_expense_presenter/widgets/add_note_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Note App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddNoteTextField(controller: _noteController),
        ),
      ),
    );
  }
}
