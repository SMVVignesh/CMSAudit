import 'envronment/base_config.dart';
import 'envronment/dev_config.dart';
import 'envronment/prod_config.dart';
import 'envronment/qa_config.dart';
import 'envronment/staging_config.dart';


/*
* This class will create the Config based on the Environment
* */


class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';
  static const String QA = 'QA';

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

/*
* This method will return the Env Object */
  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.STAGING:
        return StagingConfig();
      case Environment.QA:
        return QAConfig();
      default:
        return DevConfig();
    }
  }
}
