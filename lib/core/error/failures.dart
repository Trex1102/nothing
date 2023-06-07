class Failures {
  final String message;

  Failures(this.message);

  @override
  String toString() {
    return 'Failure: $message';
  }
}

class InvalidInputFailure extends Failures {
  InvalidInputFailure(String message) : super(message);
}

class UserRegistrationFailure extends Failures {
  UserRegistrationFailure(String message) : super(message);
}
