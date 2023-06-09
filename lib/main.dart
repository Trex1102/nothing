import 'package:flutter/material.dart';
import 'features/expense_management/presentation/add_expense_presenter/widgets/numpad_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String enteredText = '';

  void handleKeyPressed(String key) {
    setState(() {
      if (key == 'backspace') {
        if (enteredText.isNotEmpty) {
          enteredText = enteredText.substring(0, enteredText.length - 1);
        }
      } else {
        enteredText += key;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Numpad Widget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Entered Text:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                enteredText,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              NumpadWidget(onKeyPressed: handleKeyPressed),
            ],
          ),
        ),
      ),
    );
  }
}
