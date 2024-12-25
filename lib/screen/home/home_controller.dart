import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/controller/connectivity_controller.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../values/route_path.dart';

class HomeController extends ConnectivityController{

  HomeController(super.buildContext);

  void detectPlatform(BuildContext context) {
    ResponsiveBreakpoints.of(context).isDesktop ? context.go(RoutePath.windows.toPath) : context.go(RoutePath.android.toPath);
  }
}