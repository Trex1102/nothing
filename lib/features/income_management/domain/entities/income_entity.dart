import 'package:flutter/material.dart';
import 'package:nothing/features/income_management/domain/entities/category_entity.dart';

class IncomeEntity {
  final String id;
  final String userId;
  final double amount;
  final DateTime date;
  final TimeOfDay time;
  final String note;
  final CategoryEntity category;

  IncomeEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.category,
  });

  IncomeEntity copyWith({
    String? id,
    String? userId,
    double? amount,
    DateTime? date,
    TimeOfDay? time,
    String? note,
    CategoryEntity? category,
  }) {
    return IncomeEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      time: time ?? this.time,
      note: note ?? this.note,
      category: category ?? this.category,
    );
  }
}
