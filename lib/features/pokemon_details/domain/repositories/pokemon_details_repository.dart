import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';

abstract class PokemonDetailsRepository {
  Future<Either<Failure, PokemonDetails>> fetchPokemonDetails({
    required String PokemonId,
  });
}
