abstract class Failure implements Exception {
  final String message;
  final StackTrace stackTrace;

  Failure({
    required this.message,
    StackTrace? stackTrace,
  }) : stackTrace = stackTrace ?? StackTrace.current;
}

class InvalidTitleFailure extends Failure {
  InvalidTitleFailure({
    required super.message,
    super.stackTrace,
  });
}

class InvalidDescriptionFailure extends Failure {
  InvalidDescriptionFailure({
    required super.message,
    super.stackTrace,
  });
}

class InvalidTargetDateFailure extends Failure {
  InvalidTargetDateFailure({
    required super.message,
    super.stackTrace,
  });
}
