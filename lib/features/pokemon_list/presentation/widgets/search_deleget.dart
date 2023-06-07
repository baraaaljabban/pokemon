import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemon_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<PokemonListCubit>(context).filterPokemons(query);
    return BlocSelector<PokemonListCubit, PokemonListState, List<Pokemon>>(
      selector: (state) {
        return BlocProvider.of<PokemonListCubit>(context).filteredPokemons;
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text(
              "No Results Found.",
            ),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return PokemonCard(
                pokemon: state[index],
                showFavIcon: false,
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return const SizedBox();
  }
}
