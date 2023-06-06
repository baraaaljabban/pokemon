import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemon/features/pokemon_list/data/models/pokemon_response.dart';

import '../../../../core/dependency_registrar/shared_dep.dart';
import '../../../../core/errors/error_handler.dart';

abstract class PokemonListRemoteDataSource {
  Future<PokemonResponse> fetchPokemonList();
}

class PokemonListRemoteDataSourceImpl extends PokemonListRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient client;
  PokemonListRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<PokemonResponse> fetchPokemonList() async {
    const String query = '''
  query samplePokeAPIQuery {
    pokemon_v2_pokemon {
      name
      id
      base_experience
    }
  }
''';
    final QueryOptions options = QueryOptions(
      document: gql(query),
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      return PokemonResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
