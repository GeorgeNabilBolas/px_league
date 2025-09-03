import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetHandler {
  static Future<bool> isInternetAvailable() async {
    final internetStatus = await InternetConnection().internetStatus;
    return internetStatus == InternetStatus.connected;
  }
}
