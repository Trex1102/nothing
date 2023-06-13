import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/add_note_textfield.dart';
import '../widgets/numpad_widget.dart';
import '../widgets/show_amount_field.dart';
import '../../../domain/entities/category_entity.dart';
import '../widgets/category_bottom_sheet.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String weatherIcon = "sunny"; // Replace with the actual weather icon
  DateTime currentDate = DateTime.now();
  String selectedCurrency = "USD"; // Replace with the initial currency
  String amount = "0"; // Replace with the initial amount
  CategoryEntity? selectedCategory; // Add selected category variable
  List<String> currencyOptions = ["USD", "EUR", "GBP", "TK"]; // Replace with the available currency options
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            HeaderWidget(weatherIcon: weatherIcon, currentDate: currentDate),
            const SizedBox(height: 40),
            ShowAmountField(
              amount: amount,
              selectedCurrency: selectedCurrency,
              currencyOptions: currencyOptions,
              onCurrencyChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
            ),
            const SizedBox(height: 40),
            AddNoteTextField(controller: noteController),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 275),
              child: GestureDetector(
                onTap: () {
                  // Perform action when the icon is clicked
                },
                child: const Icon(
                  Icons.check_circle,
                  size: 60,
                  color: Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 205),
              child: ElevatedButton.icon(
                onPressed: () {
                  _openCategoryBottomSheet(); // Open the category bottom sheet
                },
                icon: Icon(
                  selectedCategory?.icon ?? Icons.category,
                  color: Colors.black,
                ),
                label: Text(
                  selectedCategory?.name ?? "Category",
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'MPlusRounded1c',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Expanded(
              child: NumpadWidget(
                onKeyPressed: (value) {
                  if (value == "backspace") {
                    setState(() {
                      if (amount.length > 1) {
                        amount = amount.substring(0, amount.length - 1);
                      } else {
                        amount = "0";
                      }
                    });
                  } else {
                    setState(() {
                      if (amount == "0") {
                        amount = value;
                      } else {
                        amount += value;
                      }
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _openCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return CategoryBottomSheet(
          categories: predefinedCategories,
          onCategorySelected: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddExpenseScreen(),
  ));
}