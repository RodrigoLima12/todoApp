abstract class IConnectionService {
  Future<void> getConnectionStatus();
  bool get isOnline;
}

enum ConnectionStatus {
  online,
  offline;

  bool get isOnline => this == ConnectionStatus.online;
}
