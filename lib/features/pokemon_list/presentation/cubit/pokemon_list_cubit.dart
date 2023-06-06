import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit() : super(PokemonListInitial());
}
