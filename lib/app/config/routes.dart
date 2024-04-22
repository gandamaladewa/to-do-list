enum AppRoutes {
  homeScreen,
  loginScreen,
  registerScreen,
}

extension AppRoutersExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.homeScreen:
        return '/home-screen';
      case AppRoutes.loginScreen:
        return '/login-screen';
      case AppRoutes.registerScreen:
        return '/register-screen';
    }
  }
}
