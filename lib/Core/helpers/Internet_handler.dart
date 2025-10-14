import 'dart:io';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetHandler {
  static Future<bool> get isConnected async {
    final internetStatus = await InternetConnection().internetStatus;
    return internetStatus == InternetStatus.connected;
  }

  static Future<void> isInternetAvailable() async {
    if (await isConnected) {
      return;
    } else {
      throw const SocketException('');
    }
  }
}
