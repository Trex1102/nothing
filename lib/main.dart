import 'package:flutter/material.dart';

import 'features/expense_management/presentation/add_expense_presenter/widgets/show_amount_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Show Amount Field Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ShowAmountFieldWidget(),
        ),
      ),
    );
  }
}

class ShowAmountFieldWidget extends StatefulWidget {
  @override
  _ShowAmountFieldWidgetState createState() => _ShowAmountFieldWidgetState();
}

class _ShowAmountFieldWidgetState extends State<ShowAmountFieldWidget> {
  String amount = '100';
  String selectedCurrency = 'TK';
  List<String> currencyOptions = ['USD', 'EUR', 'GBP', 'TK'];

  void onCurrencyChanged(String? value) {
    setState(() {
      selectedCurrency = value ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowAmountField(
      amount: amount,
      selectedCurrency: selectedCurrency,
      currencyOptions: currencyOptions,
      onCurrencyChanged: onCurrencyChanged,
    );
  }
}
