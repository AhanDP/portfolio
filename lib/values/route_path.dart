enum RoutePath {
  home,
  mac,
  windows,
  android,
  ios,
  error,
}

extension RoutePathExtension on RoutePath {
  String get toPath {
    switch (this) {
      case RoutePath.home:
        return "/";
      case RoutePath.windows:
        return "/windows";
      case RoutePath.mac:
        return "/mac";
      case RoutePath.android:
        return "/android";
      case RoutePath.ios:
        return "/ios";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case RoutePath.home:
        return "HOME";
      case RoutePath.windows:
        return "WINDOWS";
      case RoutePath.mac:
        return "MAC";
      case RoutePath.android:
        return "ANDROID";
      case RoutePath.ios:
        return "IOS";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case RoutePath.home:
        return "My Home";
      case RoutePath.windows:
        return "My Windows";
      case RoutePath.mac:
        return "My Mac";
      case RoutePath.android:
        return "My Android";
      case RoutePath.ios:
        return "Configure IOS";
      case RoutePath.error:
        return "My App Error";
      default:
        return "My Home";
    }
  }
}

