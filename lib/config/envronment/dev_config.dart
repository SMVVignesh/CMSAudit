import 'package:cms_audit/config/Environment.dart';

import 'base_config.dart';

/*
* This is the Dev Environment Values*/
class DevConfig implements BaseConfig {
  String get environment => Environment.DEV;
  String get loginHost => "http://nearchoice.co.in/api";
  String get apiHost => "http://nearchoice.co.in/api/v1";
  String get basicAuthorizationToken =>
      "";
  String get version => '1.0.1';

}