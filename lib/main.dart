import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'features/expense_management/presentation/add_expense_presenter/widgets/header_widget.dart';
import 'features/expense_management/presentation/add_expense_presenter/widgets/numpad_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final DateTime currentDate = DateTime.now();
  final String weatherIcon = "sunny"; // Replace with the weather icon string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 10),
            NumpadWidget(
              onKeyPressed: (value) {
                // Handle numpad key press
                print('Pressed: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
