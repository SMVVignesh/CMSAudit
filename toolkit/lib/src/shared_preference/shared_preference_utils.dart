import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  factory SharedPreferenceUtils() {
    return _singleton;
  }

  SharedPreferenceUtils._internal();

  /*
  * This is used to create the singleton class*/
  static final SharedPreferenceUtils _singleton = SharedPreferenceUtils._internal();

  static SharedPreferences? sharedPreferences;

/*
* This method is used to create the SharedPreferences Instance*/
  Future createConfig() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

/*
* This method is used to update the String Value in SharedPreferences*/
  Future<bool> setString(String key, String value) async {
    await createConfig();
    return await sharedPreferences?.setString(key, value) ?? false;
  }

/*
* This method is used to update the Int Value in SharedPreferences*/
  Future<bool> setInt(String key, int value) async {
    await createConfig();
    return await sharedPreferences?.setInt(key, value) ?? false;
  }

/*
* This method is used to update the Boolean Value in SharedPreferences*/
  Future<bool> setBool(String key, bool value) async {
    await createConfig();
    return await sharedPreferences?.setBool(key, value) ?? false;
  }

/*
* This method is used to update the Double Value in SharedPreferences*/
  Future<bool> setDouble(String key, double value) async {
    await createConfig();
    return await sharedPreferences?.setDouble(key, value) ?? false;
  }

/*
* This method is used to get the String Value from SharedPreferences*/
  Future<String?> getString(String key) async {
    await createConfig();
    return await sharedPreferences?.getString(key);
  }

/*
* This method is used to get the Int Value from SharedPreferences*/
  Future<int?> getInt(String key) async {
    await createConfig();
    return await sharedPreferences?.getInt(key);
  }

/*
* This method is used to get the Boolean Value from SharedPreferences*/
  Future<bool?> getBool(String key) async {
    await createConfig();
    return await sharedPreferences?.getBool(key);
  }

/*
* This method is used to get the Double Value from SharedPreferences*/
  Future<double?> getDouble(String key) async {
    await createConfig();
    return await sharedPreferences?.getDouble(key);
  }
}
