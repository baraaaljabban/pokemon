import 'package:flutter/material.dart';
import 'package:pokemon/features/start_up/presentation/pages/start_up_page.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String landingRoute = '/home';
  static const String loginRoute = '/login';

  static const String pokemonDetails = '/pokemonDetails';

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
        return _pageRoute(
          const StartUpPage(),
          settings,
        );
      case loginRoute:
        return _pageRoute(
          const Text("Login Page"),
          settings,
        );
      case landingRoute:
        return _pageRoute(
          const Text("Home Page"),
          settings,
        );
      case pokemonDetails:
        return _pageRoute(
          const Text("pokemon Details Page"),
          settings,
        );
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
