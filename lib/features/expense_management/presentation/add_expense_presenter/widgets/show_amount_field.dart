import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowAmountField extends StatelessWidget {
  final String amount;
  final String selectedCurrency;
  final List<String> currencyOptions;
  final Function(String?) onCurrencyChanged;

  const ShowAmountField({super.key, 
    required this.amount,
    required this.selectedCurrency,
    required this.currencyOptions,
    required this.onCurrencyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const SizedBox(width: 95),
          DropdownButton<String>(
            value: selectedCurrency,
            items: _buildCurrencyDropdownItems(),
            onChanged: onCurrencyChanged,
            iconSize: 35,
            underline: Container(),
            dropdownColor: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            amount,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'MPlusRounded1C'),
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
        return const FaIcon(FontAwesomeIcons.dollarSign, color: Colors.black, size: 30);
      case 'EUR':
        return const FaIcon(FontAwesomeIcons.euroSign, color: Colors.black, size: 30);
      case 'GBP':
        return const FaIcon(FontAwesomeIcons.sterlingSign, color: Colors.black, size: 30);
      case 'TK':
        return const FaIcon(FontAwesomeIcons.bangladeshiTakaSign, color: Colors.black, size: 30);
      default:
        return const FaIcon(FontAwesomeIcons.bangladeshiTakaSign, color: Colors.black, size: 30);
    }
  }
}
