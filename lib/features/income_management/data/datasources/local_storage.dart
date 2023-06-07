import 'package:sqflite/sqflite.dart';

import '../../data/models/income_model.dart';
import '../../../../core/error/exceptions.dart' as exceptions;

class IncomeLocalStorage {
  final Database database;

  IncomeLocalStorage(this.database);

  Future<void> createIncome(IncomeModel income) async {
    try {
      await database.insert('incomes', income.toJson());
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<List<IncomeModel>> getIncomesByUser(String userId) async {
    try {
      final List<Map<String, dynamic>> incomeMaps = await database.query(
        'incomes',
        where: 'userId = ?',
        whereArgs: [userId],
      );
      return incomeMaps.map((map) => IncomeModel.fromJson(map)).toList();
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<void> updateIncome(IncomeModel income) async {
    try {
      await database.update(
        'incomes',
        income.toJson(),
        where: 'id = ?',
        whereArgs: [income.id],
      );
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }

  Future<void> deleteIncome(String id) async {
    try {
      await database.delete(
        'incomes',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('DatabaseException: $e');
      throw exceptions.DatabaseException('Error Message');
    }
  }
}
