import 'package:nothing/features/income_management/domain/entities/category_entity.dart';
import '/core/error/failure.dart';
import '../entities/income_entity.dart';
import '../repositories/income_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateIncome {
  final IncomeRepository repository;

  CreateIncome(this.repository);

  Future<Either<Failure, void>> call({
    required String id,
    required String userId,
    required double amount,
    required DateTime date,
    required TimeOfDay time,
    required String note,
    required CategoryEntity category,
  }) async {
    //final uuid = Uuid();
    final income = IncomeEntity(
      id: id, // Generate or assign a unique ID
      userId: userId,
      amount: amount,
      date: date,
      time: time,
      note: note,
      category: category,
    );

    await repository.createIncome(income);
    return const Right(null);
  }
}
