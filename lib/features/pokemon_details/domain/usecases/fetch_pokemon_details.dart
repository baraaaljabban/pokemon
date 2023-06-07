import 'package:dartz/dartz.dart';
import 'package:pokemon/core/base_use_case.dart';
import 'package:pokemon/core/errors/failures.dart';
import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon_details/domain/repositories/pokemon_details_repository.dart';

class FetchPokemonDetails extends UseCase<String, PokemonDetails> {
  final PokemonDetailsRepository repository;
  FetchPokemonDetails({
    required this.repository,
  });
  @override
  Future<Either<Failure, PokemonDetails>> call({required String params}) async {
    return await repository.fetchPokemonDetails(PokemonId: params);
  }
}
