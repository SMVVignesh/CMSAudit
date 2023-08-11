/*
* This is the Base class for the all Environment Variable*/
abstract class BaseConfig {
  String get environment;
  String get apiHost;
  String get loginHost;

  String get basicAuthorizationToken;
  String get version;


}
