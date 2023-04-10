abstract class AppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;
  final dynamic exception;

  AppFailure({
    required this.message,
    StackTrace? stackTrace,
    this.exception,
  }) : stackTrace = stackTrace ?? StackTrace.current;
}

class InvalidTitleFailure extends AppFailure {
  InvalidTitleFailure({
    required super.message,
    super.stackTrace,
    super.exception,
  });
}

class InvalidDescriptionFailure extends AppFailure {
  InvalidDescriptionFailure({
    required super.message,
    super.stackTrace,
    super.exception,
  });
}

class InvalidTargetDateFailure extends AppFailure {
  InvalidTargetDateFailure({
    required super.message,
    super.stackTrace,
    super.exception,
  });
}

class UnknownFailure extends AppFailure {
  UnknownFailure({
    required super.message,
    super.stackTrace,
    super.exception,
  });
}
