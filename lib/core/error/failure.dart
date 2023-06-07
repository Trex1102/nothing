import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => [properties];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

// Add Expense feature failures
class InvalidInputFailure extends Failure {
  final String message;

  InvalidInputFailure(this.message) : super([message]);
}

class DatabaseFailure extends Failure {
  final String message;

  DatabaseFailure(this.message) : super([message]);
}
