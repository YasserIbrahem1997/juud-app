import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:juud/view/screens/info_screen.dart';
import 'package:page_transition/page_transition.dart';
void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: AnimatedSplashScreen(
        splash: Center(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/svg/splash.svg",
              height: double.infinity,
              width:  double.infinity,
            ),
          ),
        ),
        nextScreen:  InfoScreen(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
        pageTransitionType: PageTransitionType.bottomToTop,
      ),
    );
  }
}
