import 'package:flutter/material.dart';

import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemon_card.dart';

class PokemonsListViewController extends StatefulWidget {
  final List<Pokemon> pokemons;
  final bool showFavIcon;
  const PokemonsListViewController({
    Key? key,
    required this.pokemons,
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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.pokemons.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return PokemonCard(
            pokemon: widget.pokemons[index],
            showFavIcon: widget.showFavIcon,
          );
        },
      ),
    );
  }
}
