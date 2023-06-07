import 'package:sqflite/sqflite.dart';

import '../../data/models/expense_model.dart';
import '../../../../core/error/exceptions.dart' as exceptions;

class LocalStorage {
  final Database database;

  LocalStorage(this.database);

  Future<void> createExpense(ExpenseModel expense) async {
    try {
      await database.insert('expenses', expense.toJson());
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<List<ExpenseModel>> getExpensesByUser(String userId) async {
    try {
      final List<Map<String, dynamic>> expenseMaps = await database.query(
        'expenses',
        where: 'userId = ?',
        whereArgs: [userId],
      );
      return expenseMaps.map((map) => ExpenseModel.fromJson(map)).toList();
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<void> updateExpense(ExpenseModel expense) async {
    try {
      await database.update(
        'expenses',
        expense.toJson(),
        where: 'id = ?',
        whereArgs: [expense.id],
      );
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await database.delete(
        'expenses',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }
}
