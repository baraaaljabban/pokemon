import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/error_handler.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_list/data/datasources/pokemon_list_remote_data_source.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class PokemonListRepositoryImpl extends PokemonListRepository with CustomErrorHandler {
  final PokemonListRemoteDataSource remoteDataSource;
  PokemonListRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Pokemon>>> fetchPokemonList() async {
    try {
      final response = await remoteDataSource.fetchPokemonList();
      return right(response.pokemonV2Pokemon);
    } catch (e) {
      if (e is Exception) {
        return Left(mapCommonExceptionToFailure(e));
      }

      return Left(UnhandledFailure(message: e.toString()));
    }
  }
}
