import 'package:flutter/material.dart';

/*This Class contains only Success and Failure SnackBars*/
class SnackBarUtils {
  /*
  * This method is used to show the success Message*/
  static void showSuccess(BuildContext context, message) {
    if (!context.mounted) {
      return;
    }
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          content: Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )))),
    );
  }

  /*
  * This method is used to show the Error Message*/
  static void showError(BuildContext context, message) {
    if (!context.mounted) {
      return;
    }
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          content: Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )))),
    );
  }
}
