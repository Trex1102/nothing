import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the package
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
  String weatherIcon = "sunny";
  DateTime currentDate = DateTime.now();
  String selectedCurrency = "TK";
  String amount = "0";
  CategoryEntity? selectedCategory;
  List<String> currencyOptions = ["USD", "EUR", "TK"];
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "New Expense",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp, // Use screenutil to adapt font size
                fontFamily: 'MPlusRounded1c',
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10.h), // Use screenutil to adapt widget sizes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShowAmountField(
                amount: amount,
                selectedCurrency: selectedCurrency,
                currencyOptions: currencyOptions,
                onCurrencyChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 10.h),
          AddNoteTextField(controller: noteController),
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.only(left: 275.w),
            child: GestureDetector(
              onTap: () {
                // Perform action when the icon is clicked
              },
              child: Icon(
                Icons.check_circle,
                size: 60.sp, // Use screenutil to adapt icon size
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: ElevatedButton.icon(
              onPressed: () {
                _openCategoryBottomSheet();
              },
              icon: Icon(
                selectedCategory?.icon ?? Icons.category,
                color: Colors.black,
              ),
              label: Text(
                selectedCategory?.name ?? "Category",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'MPlusRounded1c',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp, // Use screenutil to adapt font size
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
          SizedBox(height: 0.h),
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
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _openCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
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
