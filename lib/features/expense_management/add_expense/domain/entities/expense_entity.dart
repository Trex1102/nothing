import 'package:flutter/material.dart';
import 'package:nothing/features/expense_management/add_expense/domain/entities/category_entity.dart';

enum WeatherType { sunny, rainy, cloudy, snowy, cold }

class ExpenseEntity {
  final String id;
  final String userId;
  final double amount;
  final DateTime date;
  final TimeOfDay time;
  final String note;
  final WeatherType weather;
  final CategoryEntity category;

  ExpenseEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.weather,
    required this.category,
  });

  ExpenseEntity copyWith({
    String? id,
    String? userId,
    double? amount,
    DateTime? date,
    TimeOfDay? time,
    String? note,
    WeatherType? weather,
    CategoryEntity? category,
  }) {
    return ExpenseEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      time: time ?? this.time,
      note: note ?? this.note,
      weather: weather ?? this.weather,
      category: category ?? this.category,
    );
  }
}
