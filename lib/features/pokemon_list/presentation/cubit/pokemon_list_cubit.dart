import 'package:equatable/equatable.dart';
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
}
