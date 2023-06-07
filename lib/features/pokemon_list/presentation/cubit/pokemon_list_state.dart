part of 'pokemon_list_cubit.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();

  @override
  List<Object> get props => [];
}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoadingState extends PokemonListState {}

class PokemonListErrorState extends PokemonListState {
  final String message;
  const PokemonListErrorState({
    required this.message,
  });
}

class PokemonListSuccessState extends PokemonListState {
  final List<Pokemon> pokemons;
  const PokemonListSuccessState({
    required this.pokemons,
  });
}
