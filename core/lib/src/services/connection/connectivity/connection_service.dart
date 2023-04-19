import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import '../connection_error.dart';
import '../i_connection_service.dart';

class ConnectionService extends ChangeNotifier implements IConnectionService {
  final _connectivity = Connectivity();

  ConnectionStatus _status = ConnectionStatus.offline;

  ConnectionService() {
    _connectivity.onConnectivityChanged.listen((_) => getConnectionStatus());
  }

  @override
  Future<void> getConnectionStatus() async {
    try {
      final result = await _connectivity.checkConnectivity();

      final isMobile = result == ConnectivityResult.mobile;
      final isWifi = result == ConnectivityResult.wifi;
      final isEthernet = result == ConnectivityResult.ethernet;

      if (isMobile || isWifi || isEthernet) {
        _status = ConnectionStatus.online;
      } else {
        _status = ConnectionStatus.offline;
      }

      notifyListeners();
    } catch (error, stacktrace) {
      throw ConnectionError(
          message: 'Connection Error', stackTrace: stacktrace, exception: error.toString());
    }
  }

  @override
  bool get isOnline => _status.isOnline;
}
