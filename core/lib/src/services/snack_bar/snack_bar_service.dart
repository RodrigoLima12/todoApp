import 'package:flutter/material.dart';

class SnackbarService {
  SnackbarService._()
      : scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  static SnackbarService instance = SnackbarService._();
  void showSnackbar(SnackBar snackbar) {
    scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }

  void dispose() {
    scaffoldMessengerKey.currentState!.dispose();
  }
}
