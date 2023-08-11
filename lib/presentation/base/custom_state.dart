import 'package:flutter/cupertino.dart';

abstract class CustomState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  String _screenName = "";
  bool _smallScreen  = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    _smallScreen = screenWidth < 700;
    return myBuild(context);
  }

  Widget myBuild(BuildContext context);

  String setScreen();

  bool isMobile(){
    return _smallScreen;
  }

  @override
  void initState() {
    super.initState();
    _screenName = setScreen();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:

        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
    }
  }

  closeRemainingScreens(){
    Navigator.of(context).popUntil((route) => route.isCurrent);
  }
}
