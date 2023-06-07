import 'package:nothing/features/income_management/domain/repositories/income_repository.dart';
import '../datasources/income_datasource.dart';
import '../models/income_model.dart';
import '../../domain/entities/income_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeDataSource incomeDataSource;
  final NetworkInfo networkInfo;

  IncomeRepositoryImpl({
    required this.incomeDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> createIncome(IncomeEntity income) async {
    if (await networkInfo.isConnected) {
      try {
        final incomeModel = IncomeModel.fromEntity(income);
        await incomeDataSource.createIncome(incomeModel);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<List<IncomeEntity>> getIncomesByUser(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final incomeModels = await incomeDataSource.getIncomesByUser(userId);
        return incomeModels.map((model) => model.toEntity()).toList();
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<void> updateIncome(IncomeEntity income) async {
    if (await networkInfo.isConnected) {
      try {
        final incomeModel = IncomeModel.fromEntity(income);
        await incomeDataSource.updateIncome(incomeModel);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<void> deleteIncome(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await incomeDataSource.deleteIncome(id);
      } on DatabaseException {
        throw RepositoryException();
      }
    } else {
      throw NetworkException();
    }
  }
}
