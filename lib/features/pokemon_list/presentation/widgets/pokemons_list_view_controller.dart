import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemon_card.dart';

class PokemonsListViewController extends StatefulWidget {
  final bool showFavIcon;
  const PokemonsListViewController({
    Key? key,
    this.showFavIcon = true,
  }) : super(key: key);

  @override
  State<PokemonsListViewController> createState() => _PokemonsListViewControllerState();
}

class _PokemonsListViewControllerState extends State<PokemonsListViewController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: BlocSelector<PokemonListCubit, PokemonListState, List<Pokemon>>(
        selector: (state) {
          return widget.showFavIcon
              ? BlocProvider.of<PokemonListCubit>(context).pokemons
              : BlocProvider.of<PokemonListCubit>(context).favorite;
        },
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return PokemonCard(
                pokemon: state[index],
                showFavIcon: widget.showFavIcon,
              );
            },
          );
        },
      ),
    );
  }
}
