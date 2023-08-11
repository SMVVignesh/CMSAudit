
import 'package:cms_audit/presentation/pages/dashboard/page/dashboard_screen.dart';
import 'package:cms_audit/presentation/pages/login/page/login_page_main.dart';
import 'package:cms_audit/presentation/pages/splash/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tool_kit/tool_kit.dart';

import 'config/Environment.dart';
import 'core/constants/constants.dart';
import 'core/localizations/localizations.dart';


void main() async {
  setUpNativeSplash();
  setUpEnvironment();
  runApp(const MyApp());
}

void setUpNativeSplash() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}
/*This method is used to setup the Environment*/
void setUpEnvironment() {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: const [Locale('en', 'UR'), Locale('ar', 'BH')],
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizationsDelegate(),
        ],
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.getScreenRoute(SPLASH_SCREEN),
        routes: AppRoute.getRoutes(getScreens()));
  }

  List<RouteModel> getScreens() {
    List<RouteModel> screens = [];
    screens.add(RouteModel(SPLASH_SCREEN, Splash()));
    screens.add(RouteModel(LOGIN_SCREEN, LoginPage()));
    screens.add(RouteModel(HOME_SCREEN, DashboardScreen()));
    return screens;
  }

}