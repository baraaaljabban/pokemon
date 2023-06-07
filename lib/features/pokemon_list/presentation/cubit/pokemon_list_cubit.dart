import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/domain/usecases/fetch_pokemon_list.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  final FetchPokemonList _fetchPokemonList;
  PokemonListCubit({required FetchPokemonList fetchPokemonList})
      : _fetchPokemonList = fetchPokemonList,
        super(PokemonListInitial());
  List<Pokemon> pokemons = [];
  List<Pokemon> favorite = [];
  List<Pokemon> filteredPokemons = [];
  String _pokemonName = '';
  String _pokemonExperience = '';

  void fetchPokemonListDispatcher() async {
    emit(PokemonListLoadingState());
    final result = await _fetchPokemonList.call(params: null);
    result.fold(
      (l) => emit(PokemonListErrorState(
        message: l.message,
      )),
      (r) => {
        pokemons.addAll(r),
        emit(PokemonListSuccessState(pokemons: pokemons)),
      },
    );
  }

  void addToFavorite({required Pokemon pokemon, required bool isToAdd}) {
    if (isToAdd) {
      favorite.add(pokemon);
    } else {
      favorite.remove(pokemon);
    }
  }

  void pokemonName({required String pokemonName}) {
    _pokemonName = pokemonName;
  }

  void pokemonExperience({required String pokemonExperience}) {
    _pokemonExperience = pokemonExperience;
  }

  void addNewPokemon() {
    if (_pokemonName.isEmpty || _pokemonExperience.isEmpty) {
      emit(const PokemonListErrorState(message: "make sure you entered both texts"));
    } else {
      pokemons.insert(0, Pokemon(name: _pokemonName, id: 1, baseExperience: int.tryParse(_pokemonExperience) ?? 0));
      _pokemonName = '';
      _pokemonExperience = '';
      emit(PokemonListSuccessState(pokemons: pokemons));
    }
  }

  void filterPokemons(String searchQuery) {
    filteredPokemons = pokemons.where((pokemon) {
      final name = pokemon.name.toLowerCase();
      return name.contains(searchQuery);
    }).toList();
  }
}
