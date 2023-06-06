import 'package:flutter/material.dart';

import '../../../add_expense/domain/entities/expense_entity.dart';
import '../../../add_expense/domain/entities/category_entity.dart';

class ViewExpenseEntity extends ExpenseEntity {
  ViewExpenseEntity({
    required String id,
    required String userId,
    required double amount,
    required DateTime date,
    required TimeOfDay time,
    required String note,
    required WeatherType weather,
    required CategoryEntity category,
  }) : super(
          id: id,
          userId: userId,
          amount: amount,
          date: date,
          time: time,
          note: note,
          weather: weather,
          category: category,
        );
}
