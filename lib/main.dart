import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:juud/view/screens/home_screens/home_screens.dart';
import 'package:juud/view/screens/info_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'AR')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar', 'AR'),
      child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(), // Wrap your app
        ),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,

      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: 'Tajawal',

      ),
      darkTheme: ThemeData.dark(),
      home: AnimatedSplashScreen(
        splash: Center(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height/1,
              width:  MediaQuery.of(context).size.width/1,
            ),
          ),
        ),
        nextScreen:  HomeScreens(),
        splashIconSize: MediaQuery.of(context).size.height/1,
        splashTransition: SplashTransition.sizeTransition,
        duration: 3000,
        pageTransitionType: PageTransitionType.rightToLeft,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
