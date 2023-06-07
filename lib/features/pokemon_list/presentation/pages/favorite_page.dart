import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemons_list_view_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      body: BlocSelector<PokemonListCubit, PokemonListState, List<Pokemon>>(
        selector: (selector) {
          return BlocProvider.of<PokemonListCubit>(context).favorite;
        },
        builder: (context, state) {
          return PokemonsListViewController(pokemons: state, showFavIcon: false);
        },
      ),
    );
  }
}
