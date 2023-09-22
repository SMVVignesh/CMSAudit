import 'package:cms_audit/core/utils/custom_color.dart';
import 'package:cms_audit/domain/share_preference/shared_preference_repository.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tool_kit/tool_kit.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/constants.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends CustomState<Splash> {
  String version = "Version";

  @override
  String setScreen() {
    return SPLASH_SCREEN;
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    updateVersion();
    moveToNextScreen();
  }

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColor.toolbarBg,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/app_icon.png",
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Text(
                  version,
                  style: const TextStyle(
                      color: CustomColor.lightBlue, fontSize: 12),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void moveToNextScreen() async {
    final DateFormat inputFormatter = DateFormat("yyyy-MM-dd");
    DateTime expiryDate = inputFormatter.parse("2023-10-15");
    int difference = expiryDate.difference(DateTime.now()).inDays;
    print("difference $difference");
    if(difference<=0){
      return;
    }
    String? token = await SharedPreferenceRepository().getAccessToken();
    print("Token $token");
    Future.delayed(Duration(milliseconds: 1500), () async {
      if ((token?.length ?? 0) == 0) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(
              context, AppRoute.getScreenRoute(LOGIN_SCREEN));
        }
      } else {
        if (context.mounted) {
          Navigator.pushReplacementNamed(
              context, AppRoute.getScreenRoute(HOME_SCREEN));
        }
      }
    });
  }

  void updateVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (context.mounted) {
      setState(() {
        version = "Version ${packageInfo.version}";
      });
    }
  }
}
