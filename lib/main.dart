import 'dart:io';
import 'package:portfolio/utility/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utility/router.dart' as router;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 5;
  }
}

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setPathUrlStrategy();
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

Map<int, Color> swatch = {
  50: const Color(0xFFE0E0ED),
  100: const Color(0xFFB3B3D1),
  200: const Color(0xFF8080B3),
  300: const Color(0xFF4D4D94),
  400: const Color(0xFF26267D),
  500: const Color(0xFF000066),
  600: const Color(0xFF00005E),
  700: const Color(0xFF000053),
  800: const Color(0xFF000049),
  900: const Color(0xFF000038),
};

class _MainState extends State<Main> {
  late String initialLocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: ScreenUtil.defaultSize,
      builder: (context, snapshot) {
        return MaterialApp.router(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF010066, swatch),
            fontFamily: 'PlusJakartaSans',),
          title: 'Portfolio',
          /*navigatorObservers: <NavigatorObserver>[observer],*/
          debugShowCheckedModeBanner: !kReleaseMode,
          routerConfig: router.router,
        );
      }
    );
  }
}
