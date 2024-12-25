import 'dart:developer';
import 'package:portfolio/component/android_ui.dart';
import 'package:portfolio/component/ios_ui.dart';
import 'package:portfolio/component/macos_ui.dart';
import 'package:portfolio/screen/home/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../component/windows_ui.dart';
import '../values/route_path.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePath.home.toPath,
  routes: <RouteBase>[
    GoRoute(
      name: RoutePath.home.toName,
      path: RoutePath.home.toPath,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      name: RoutePath.windows.toName,
      path: RoutePath.windows.toPath,
      builder: (BuildContext context, GoRouterState state) {
        return const WindowsUi();
      },
    ),
    GoRoute(
      name: RoutePath.mac.toName,
      path: RoutePath.mac.toPath,
      builder: (BuildContext context, GoRouterState state) {
        return const MacosUi();
      },
    ),
    GoRoute(
      name: RoutePath.android.toName,
      path: RoutePath.android.toPath,
      builder: (BuildContext context, GoRouterState state) {
        return const AndroidUi();
      },
    ),
    GoRoute(
      name: RoutePath.ios.toName,
      path: RoutePath.ios.toPath,
      builder: (BuildContext context, GoRouterState state) {
        return const IosUi();
      },
    ),
    /*GoRoute(
          name: RoutePath.wallRoute,
          path: "${RoutePath.wallRoute}/:name",
          builder: (context, state) {
            state.queryParameters.forEach(
              (key, value) {
                log("$key:$value");
              },
            );
            String name = state.pathParameters["name"]!;
            return const HomeScreen();
          })*/
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    log('inside the redirect always');
    log('inside the state :: ${state.matchedLocation}');
    return null;
  },
);

MaterialPageRoute<dynamic> errorPageRoute(RouteSettings settings) {
  if (kReleaseMode) {
    return MaterialPageRoute(builder: (context) => const Placeholder());
  } else {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
