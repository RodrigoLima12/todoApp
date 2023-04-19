import 'package:dependencies/dependencies.dart';

import '../i_connection_service.dart';
import 'connection_service.dart';

class ConnectionStore extends Store<ConnectionStatus> {
  final ConnectionService _connectionService;

  ConnectionStore(this._connectionService) : super(ConnectionStatus.offline);

  bool get isOnline => state == ConnectionStatus.online;

  @override
  void initStore() {
    super.initStore();

    _connectionService.addListener(() {
      _connectionService.isOnline
          ? update(ConnectionStatus.online)
          : update(ConnectionStatus.offline);
    });
  }
}
