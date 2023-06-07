import 'package:flutter/material.dart';
import 'package:pokemon/core/navigation/nav_args.dart';
import 'package:pokemon/features/login/presentation/pages/login_page.dart';
import 'package:pokemon/features/pokemon_details/presentation/pages/pokemon_deatils_page.dart';
import 'package:pokemon/features/pokemon_list/presentation/pages/favorite_page.dart';
import 'package:pokemon/features/pokemon_list/presentation/pages/new_pokemon_page.dart';
import 'package:pokemon/features/pokemon_list/presentation/pages/pokemons_page.dart';
import 'package:pokemon/features/start_up/presentation/pages/start_up_page.dart';

class NavRouter {
  NavRouter._();

  static const String initialRoute = '/';
  static const String landingRoute = '/home';
  static const String loginRoute = '/login';
  static const String pokemonDetails = '/pokemonDetails';
  static const String favorite = '/favorite';
  static const String newPokemon = '/newPokemon';

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
          const LoginPage(),
          settings,
        );
      case landingRoute:
        return _pageRoute(
          const PokemonsPage(),
          settings,
        );
      case pokemonDetails:
        return _pageRoute(
          PokemonDetailsPage(args: settings.arguments as PokemonDetailsArgs),
          settings,
        );
      case favorite:
        return _pageRoute(
          const FavoritePage(),
          settings,
        );
      case newPokemon:
        return _pageRoute(
          const NewPokemonPage(),
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
