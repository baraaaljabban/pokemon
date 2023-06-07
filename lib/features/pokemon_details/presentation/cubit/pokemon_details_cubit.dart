import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsInitial());

  void onFetchPokemonDetails({required int pokemonId}) {}
}
