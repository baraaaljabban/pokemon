import 'package:flutter/material.dart';

import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemon_card.dart';

class PokemonsListViewController extends StatefulWidget {
  final bool showFavIcon;
  final List<Pokemon> pokemons;
  const PokemonsListViewController({
    Key? key,
    this.showFavIcon = true,
    required this.pokemons,
  }) : super(key: key);

  @override
  State<PokemonsListViewController> createState() => _PokemonsListViewControllerState();
}

class _PokemonsListViewControllerState extends State<PokemonsListViewController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: widget.pokemons.isEmpty
          ? const Center(
              child: Text("No Data were found."),
            )
          : ListView.builder(
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
