// ignore_for_file: annotate_overrides, non_constant_identifier_names

import '../Environment.dart';
import 'base_config.dart';

/*
* This is the Dev Environment Values*/
class ProdConfig implements BaseConfig {
  String get environment => Environment.DEV;
  String get loginHost => "http://nearchoice.co.in";
  String get apiHost => "http://nearchoice.co.in/api/v1";
  String get basicAuthorizationToken =>
      "";
  String get version => '1.0.1';

}
