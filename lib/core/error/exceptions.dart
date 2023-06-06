class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return 'Failure: $message';
  }
}

class DataSourceException extends Failure {
  DataSourceException() : super('DataSourceException');
}

class RepositoryException extends Failure {
  RepositoryException() : super('RepositoryException');
}

class NetworkException extends Failure {
  NetworkException() : super('NetworkException');
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() {
    return 'DatabaseException: $message';
  }
}


