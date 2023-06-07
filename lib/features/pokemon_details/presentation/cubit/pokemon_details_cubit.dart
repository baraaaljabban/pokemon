import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';

import 'package:pokemon/features/pokemon_details/domain/usecases/fetch_pokemon_details.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final FetchPokemonDetails fetchPokemonDetails;
  PokemonDetailsCubit({required this.fetchPokemonDetails}) : super(PokemonDetailsInitial());

  void onFetchPokemonDetails({required int pokemonId}) async {
    emit(PokemonDetailsLoadingState());
    final result = await fetchPokemonDetails(params: pokemonId);
    result.fold(
      (l) => emit(
        PokemonDetailsFailedState(message: l.message),
      ),
      (r) => emit(
        PokemonDetailsSuccessfulState(pokemonDetails: r, id: '$pokemonId'),
      ),
    );
  }
}
