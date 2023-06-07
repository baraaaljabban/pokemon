import 'package:dartz/dartz.dart';
import 'package:pokemon/core/base_use_case.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon_list/domain/repositories/pokemon_list_repository.dart';

class FetchPokemonList extends UseCase<void, List<Pokemon>> {
  final PokemonListRepository repository;
  FetchPokemonList({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Pokemon>>> call({required void params}) async {
    return await repository.fetchPokemonList();
  }
}
