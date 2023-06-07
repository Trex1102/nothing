import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nothing/features/income_management/domain/entities/category_entity.dart';
import '../../domain/entities/income_entity.dart';

class IncomeModel {
  final String id;
  final String userId;
  final double amount;
  final String date;
  final String time;
  final String note;
  final String categoryId;

  IncomeModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
    required this.categoryId,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'],
      date: (json['date']),
      time: (json['time']),
      note: json['note'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'date': date,
      'time': time,
      'note': note,
      'categoryId': categoryId,
    };
  }

  factory IncomeModel.fromEntity(IncomeEntity entity) {
    return IncomeModel(
      id: entity.id,
      userId: entity.userId,
      amount: entity.amount,
      date: _getStringFromDateTime(entity.date),
      time: _getStringFromTime(entity.time),
      note: entity.note,
      categoryId: entity.category.id,
    );
  }

  IncomeEntity toEntity() {
    return IncomeEntity(
      id: id,
      userId: userId,
      amount: amount,
      date: _getDateTimeFromString(date),
      time: _getTimeFromString(time),
      note: note,
      category: _getCategoryFromId(categoryId),
    );
  }

  static DateTime _getDateTimeFromString(String dateString) {
    return DateFormat('yyyy-MM-dd').parse(dateString);
  }

  static String _getStringFromDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static TimeOfDay _getTimeFromString(String timeString) {
    final time = timeString.split(':');
    return TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
  }

  static String _getStringFromTime(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }

  static CategoryEntity _getCategoryFromId(String categoryId) {
    return predefinedIncomeCategories
        .firstWhere((category) => category.id == categoryId);
  }
}
