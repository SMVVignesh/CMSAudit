
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetInfoUtils {
  static Future<bool> hasConnection() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
