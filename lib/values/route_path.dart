enum RoutePath {
  dashboard,
  mac,
  register,
  windows,
  workflow,
  error,
  onBoarding,
}

extension RoutePathExtension on RoutePath {
  String get toPath {
    switch (this) {
      case RoutePath.windows:
        return "/windows";
      case RoutePath.mac:
        return "/mac";
      case RoutePath.register:
        return "/register";
      case RoutePath.workflow:
        return "/workflow";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case RoutePath.windows:
        return "WINDOWS";
      case RoutePath.mac:
        return "MAC";
      case RoutePath.register:
        return "REGISTER";
      case RoutePath.workflow:
        return "WORKFLOW";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case RoutePath.windows:
        return "My Windows";
      case RoutePath.mac:
        return "My Mac";
      case RoutePath.register:
        return "My App Register";
      case RoutePath.workflow:
        return "Configure Workflow";
      case RoutePath.error:
        return "My App Error";
      case RoutePath.onBoarding:
        return "Welcome to My App";
      default:
        return "My App";
    }
  }
}

