import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class ShowAmountField extends StatelessWidget {
  final String amount;
  final String selectedCurrency;
  final List<String> currencyOptions;
  final Function(String?) onCurrencyChanged;

  const ShowAmountField({
    Key? key,
    required this.amount,
    required this.selectedCurrency,
    required this.currencyOptions,
    required this.onCurrencyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Row(
      children: [
        DropdownButton<String>(
          value: selectedCurrency,
          items: _buildCurrencyDropdownItems(),
          onChanged: onCurrencyChanged,
          iconSize: 35.sp, // Use screenutil for icon size
          underline: Container(),
          dropdownColor: Colors.white,
          icon: const Icon(
            Icons.arrow_drop_down, // Use the built-in dropdown arrow icon
            color: Colors.black, // Set the arrow color to amber
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 50.sp, // Use screenutil for font size
            fontWeight: FontWeight.bold,
            fontFamily: 'MPlusRounded1C',
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _buildCurrencyDropdownItems() {
    return currencyOptions.map((currency) {
      return DropdownMenuItem<String>(
        value: currency,
        child: _buildCurrencyIcon(currency),
      );
    }).toList();
  }

  Widget _buildCurrencyIcon(String currency) {
    String iconPath = '';

    switch (currency) {
      case 'USD':
        iconPath =
            'assets/icons/usd.png'; // Replace with the path to your custom USD icon
        break;
      case 'EUR':
        iconPath =
            'assets/icons/euro.png'; // Replace with the path to your custom EUR icon
        break;
      case 'TK':
        iconPath =
            'assets/icons/taka.png'; // Replace with the path to your custom TK icon
        break;
      default:
        iconPath =
            'assets/icons/taka.png'; // Replace with a default icon or an empty icon
        break;
    }

    // Load the icon as an Image widget
    return Image.asset(
      iconPath,
      color: Colors.black, // Customize the icon color as needed
      width: 40.sp, // Use screenutil for icon size
      height: 40.sp, // Use screenutil for icon size
    );
  }
}
