import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';

abstract class PokemonListRepository {
  Future<Either<Failure, List<Pokemon>>> fetchPokemonList();
}
