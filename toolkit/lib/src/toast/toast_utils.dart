import 'package:fluttertoast/fluttertoast.dart';

/*
This class is used to create the toast to show the messages
 */
class ToastUtils {
  /*
  This function is used to show the message
   */
  static void showMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
