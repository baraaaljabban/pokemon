part of 'pokemon_details_cubit.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();

  @override
  List<Object> get props => [];
}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoadingState extends PokemonDetailsState {}

class PokemonDetailsSuccessfulState extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;
  final String id;
  const PokemonDetailsSuccessfulState({
    required this.pokemonDetails,
    required this.id,
  });
}

class PokemonDetailsFailedState extends PokemonDetailsState {
  final String message;
  const PokemonDetailsFailedState({
    required this.message,
  });
}
