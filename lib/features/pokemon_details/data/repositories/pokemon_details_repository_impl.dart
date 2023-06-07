import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/error_handler.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_details/data/datasources/pokemon_details_remote_data_source.dart';
import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl extends PokemonDetailsRepository with CustomErrorHandler {
  final PokemonDetailsRemoteDataSource remoteDataSource;
  PokemonDetailsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, PokemonDetails>> fetchPokemonDetails({required int pokemonId}) async {
    try {
      final pokemonDetails = await remoteDataSource.fetchPokemonDetails(id: pokemonId);
      return right(pokemonDetails);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
