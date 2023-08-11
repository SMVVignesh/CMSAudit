import 'dart:convert';

import 'package:cms_audit/presentation/pages/login/model/login_response.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../core/constants/shared_preference_constants.dart';
import '../../data/login/new_login_response.dart';

class SharedPreferenceRepository {
  factory SharedPreferenceRepository() {
    return _singleton;
  }

  SharedPreferenceRepository._internal();

  /*
  * This is used to create the singleton class*/
  static final SharedPreferenceRepository _singleton =
      SharedPreferenceRepository._internal();

  /*
  * This method is used to save access token*/
  Future<bool> setAccessToken(String? value) async {
    return await SharedPreferenceUtils()
        .setString(SharedPreferenceConstant.ACCESS_KEY, value ?? "");
  }

  /*
  * This method is used to get the saved access token*/
  Future<String?> getAccessToken() async {
    return await SharedPreferenceUtils()
        .getString(SharedPreferenceConstant.ACCESS_KEY);
  }

  /*
  * This method is used to save access token*/
  Future<bool> setEmail(String? value) async {
    return await SharedPreferenceUtils()
        .setString(SharedPreferenceConstant.EMAIL, value ?? "");
  }

  /*
  * This method is used to get the saved access token*/
  Future<String?> getEmail() async {
    await SharedPreferenceUtils().getString(SharedPreferenceConstant.EMAIL) ??
        "";
  }


  /*
  * This method is used to save the Login Response*/
  Future<bool> saveLoginData(LoginResponse? loginResponseModel) async {
    return await SharedPreferenceUtils().setString(
        SharedPreferenceConstant.LOGIN_RESPONSE,
        (loginResponseModel == null) ? "" : jsonEncode(loginResponseModel));
  }

  /*
  * This method is used to get the Login Response*/
  Future<LoginResponse?> getLoginData() async {
    Future<String?> data = SharedPreferenceUtils()
        .getString(SharedPreferenceConstant.LOGIN_RESPONSE);
    String? loginData = await data;
    if (loginData != null && loginData.isNotEmpty) {
      LoginResponse loginResponseModel =
      LoginResponse.fromJson(jsonDecode(loginData));
      return loginResponseModel;
    }
    return null;
  }
}
