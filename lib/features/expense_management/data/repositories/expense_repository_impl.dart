import 'package:nothing/features/expense_management/data/datasources/expense_datasource_impl.dart';

import '../../data/datasources/expense_datasource.dart';
import '../../data/models/expense_model.dart';
import '../../domain/entities/expense_entity.dart';
import '../../domain/repositories/expense_repository.dart';
import '/../../../core/error/exceptions.dart';
import '/../../../core/network/network_info.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDataSource expenseDataSource;
  final NetworkInfo networkInfo;

  ExpenseRepositoryImpl({
    required this.expenseDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> createExpense(ExpenseEntity expense) async {
    if (await networkInfo.isConnected) {
      try {
        final expenseModel = ExpenseModel.fromEntity(expense);
        await expenseDataSource.createExpense(expenseModel);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<List<ExpenseEntity>> getExpensesByUser(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final expenseModels = await expenseDataSource.getExpensesByUser(userId);
        return expenseModels.map((model) => model.toEntity()).toList();
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<ExpenseEntity> getExpenseById(String expenseId) async {
    if (await networkInfo.isConnected) {
      try {
        final expenseModel = await expenseDataSource.getExpenseById(expenseId);
        return expenseModel.toEntity();
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<void> updateExpense(ExpenseEntity expense) async {
    if (await networkInfo.isConnected) {
      try {
        final expenseModel = ExpenseModel.fromEntity(expense);
        await expenseDataSource.updateExpense(expenseModel);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<void> deleteExpense(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await expenseDataSource.deleteExpense(id);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }
}
