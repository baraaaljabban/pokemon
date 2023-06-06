import 'package:flutter/material.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String landingRoute = '/home';
  static const String loginRoute = '/login';

  static const String jobDetails = '/pokemonDetails';

  static MaterialPageRoute _pageRoute(Widget page, settings, {bool fullScreenDialog = false}) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
      fullscreenDialog: fullScreenDialog,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
