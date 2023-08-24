import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../domain/share_preference/shared_preference_repository.dart';
import '../constants/constants.dart';
import 'custom_color.dart';
import 'package:intl/intl.dart';


class Utils {
  /*
* This method is used to validate the email format*/
  static bool isValidEmail(String? email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");
    return emailValid;
  }

  static void showUnAuthorizedToken(BuildContext context) async {
    Future.delayed(Duration.zero, () {
      DialogUtils.showCustomDialog(
          context: context,
          themeColor: CustomColor.splashScreenTop,
          heading: "Access Denied",
          desc: "Section token expire, Please login again.",
          positiveBtn: "Login",
          positiveClick: () {
            clearCacheAndNavigateToLogin(context);
          },
          willPop: false);
    });
  }

  static void clearCacheAndNavigateToLogin(BuildContext context) async {
    await SharedPreferenceRepository().setAccessToken(null);
    Navigator.pushReplacementNamed(
        context, AppRoute.getScreenRoute(LOGIN_SCREEN));
  }

  static String getNewGuId() {
    return Guid.newGuid.value;
  }

  static String getDisplayFormat(String s) {
    final DateFormat inputFormatter = DateFormat("yyyy-MM-ddThh:mm:ss");
    final DateFormat outputFormatter = DateFormat("yyyy-MM-dd, hh:mm aa");
    try {
      return outputFormatter.format(inputFormatter.parse(s));
    } catch (e) {
      print("Exception :${e.toString()}");
      return "n/a";
    }
  }
}
