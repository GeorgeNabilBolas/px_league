import 'dart:io';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetHandler {
  static Future<void> isInternetAvailable() async {
    final internetStatus = await InternetConnection().internetStatus;
    if (internetStatus == InternetStatus.connected) {
      return;
    } else {
      throw const SocketException('');
    }
  }
}
