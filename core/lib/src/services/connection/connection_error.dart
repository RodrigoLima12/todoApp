import '../../../core.dart';

class ConnectionError extends AppFailure {
  ConnectionError({
    required super.message,
    super.stackTrace,
    super.exception,
  });
}

class NoConnectionError extends AppFailure {
  NoConnectionError({
    super.stackTrace,
    super.exception,
  }) : super(message: 'Você não possui conexão com a internet, tente novamente mais tarde.');
}
