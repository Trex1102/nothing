import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatelessWidget {
  final String weatherIcon;
  final DateTime currentDate;

  HeaderWidget({required this.weatherIcon, required this.currentDate});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM, y').format(currentDate);

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Perform action when the close button is pressed
                    },
                  ),
                  SizedBox(width: 95),
                  Text(
                    "New Expense",
                    style: TextStyle(fontSize: 16, fontFamily: 'MPlusRounded1C', fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 90),
              Icon(
                getWeatherIcon(weatherIcon),
                size: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.calendar_today, size: 20),
              ),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 16, fontFamily: 'MPlusRounded1C', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData getWeatherIcon(String weatherIcon) {
    switch (weatherIcon) {
      case "rainy":
        return Icons.beach_access; // Replace with rainy icon
      case "cloudy":
        return Icons.cloud; // Replace with cloudy icon
      case "sunny":
        return Icons.wb_sunny; // Replace with sunny icon
      case "cold":
        return Icons.ac_unit; // Replace with cold icon
      case "snowy":
        return Icons.ac_unit; // Replace with snowy icon
      default:
        return Icons.error; // Default icon for unknown weather
    }
  }
}
