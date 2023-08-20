import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    switch (currency) {
      case 'USD':
        return FaIcon(FontAwesomeIcons.dollarSign, color: Colors.black, size: 30.sp); // Use screenutil for icon size
      case 'EUR':
        return FaIcon(FontAwesomeIcons.euroSign, color: Colors.black, size: 30.sp); // Use screenutil for icon size
      case 'GBP':
        return FaIcon(FontAwesomeIcons.sterlingSign, color: Colors.black, size: 30.sp); // Use screenutil for icon size
      case 'TK':
        return FaIcon(FontAwesomeIcons.bangladeshiTakaSign, color: Colors.black, size: 30.sp); // Use screenutil for icon size
      default:
        return FaIcon(FontAwesomeIcons.bangladeshiTakaSign, color: Colors.black, size: 30.sp); // Use screenutil for icon size
    }
  }
}
