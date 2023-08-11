import 'package:flutter/material.dart';
import 'package:tool_kit/src/route/route_model.dart';


/*
This class contains all helpful method in Navigation
 */
class AppRoute {
  /*
  This function will return all routes in the list
   */
  static Map<String, Widget Function(BuildContext)> getRoutes(
      List<RouteModel> screens) {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (RouteModel item in screens) {
      routes[getScreenRoute(item.screenName)] = (context) => item.screen;
    }
    return routes;
  }

  /*
  This function will return routes base on the screen name
   */
  static getScreenRoute(String screenName) {
    return "/$screenName";
  }

  /*
  This function is used to push from one screen to the another screen using screen name
   */
  static Future<dynamic> pushByName(
      {required BuildContext context,
      required String screenName,
      dynamic arguments}) async {
    if (arguments != null) {
      return await Navigator.pushNamed(context, getScreenRoute(screenName),
          arguments: arguments);
    } else {
      return await Navigator.pushNamed(context, getScreenRoute(screenName));
    }
  }

  /*
  This function is used to pushReplace from one screen to the another screen using screen name
   */
  static pushReplacementByName(
      {required BuildContext context,
      required String screenName,
      dynamic arguments}) {
    if (arguments != null) {
      Navigator.pushReplacementNamed(context, getScreenRoute(screenName),
          arguments: arguments);
    } else {
      Navigator.pushReplacementNamed(context, getScreenRoute(screenName));
    }
  }

  /*
  This function is used to get the arguments from the previous screen
   */
  static dynamic getArguments(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments;
  }

  /*
  This function is used to pop the current screen
   */
  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
