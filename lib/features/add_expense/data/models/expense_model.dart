import 'package:flutter/material.dart';
import 'package:nothing/features/add_expense/domain/entities/category_entity.dart';
import '../../domain/entities/expense_entity.dart';


class ExpenseModel {
  final String id;
  final String userId;
  final double amount;
  final DateTime date;
  final TimeOfDay time;
  final String note;
  final String weather;
  final String categoryId;

  ExpenseModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.weather,
    required this.categoryId,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      time: TimeOfDay.fromDateTime(DateTime.parse(json['time'])),
      note: json['note'],
      weather: json['weather'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'note': note,
      'weather': weather,
      'categoryId': categoryId,
    };
  }


  factory ExpenseModel.fromEntity(ExpenseEntity entity) {
    return ExpenseModel(
      id: entity.id,
      userId: entity.userId,
      amount: entity.amount,
      date: entity.date,
      time: entity.time,
      note: entity.note,
      weather: _getStringFromWeatherType(entity.weather),
      categoryId: entity.category.id,
    );
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      userId: userId,
      amount: amount,
      date: date,
      time: time,
      note: note,
      weather: _getWeatherTypeFromString(weather),
      category: _getCategoryFromId(categoryId),
    );
  }
  
  static CategoryEntity _getCategoryFromId(String categoryId) {
    return predefinedCategories.firstWhere((category) => category.id == categoryId);
  }

  static WeatherType _getWeatherTypeFromString(String weatherString) {
    switch (weatherString) {
      case 'sunny':
        return WeatherType.sunny;
      case 'rainy':
        return WeatherType.rainy;
      case 'cloudy':
        return WeatherType.cloudy;
      case 'snowy':
        return WeatherType.snowy;
      case 'cold':
        return WeatherType.cold;
      default:
        return WeatherType.sunny;
    }
  }

  static String _getStringFromWeatherType(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
        return 'sunny';
      case WeatherType.rainy:
        return 'rainy';
      case WeatherType.cloudy:
        return 'cloudy';
      case WeatherType.snowy:
        return 'snowy';
      case WeatherType.cold:
        return 'cold';
      default:
        return 'sunny';
    }
  }
}
