import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemon/core/errors/error_handler.dart';
import 'package:pokemon/core/network/graphql_client.dart';
import 'package:pokemon/features/pokemon_details/data/models/pokemon_details_response.dart';

abstract class PokemonDetailsRemoteDataSource {
  Future<PokemonDetailsResponse> fetchPokemonDetails({required int id});
}

class PokemonDetailsRemoteDataSourceImpl extends PokemonDetailsRemoteDataSource with CustomErrorHandler {
  final MyGraphQLClient client;
  PokemonDetailsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<PokemonDetailsResponse> fetchPokemonDetails({required int id}) async {
    String query = r'''
    query MyQuery($id: Int!) {
      pokemon_v2_itemgameindex_by_pk(id: $id) {
        pokemon_v2_generation {
          name
        }
      }
      pokemon_v2_location_by_pk(id: $id) {
        name
      }
      pokemon_v2_machine_by_pk(id: $id) {
        pokemon_v2_move {
          name
        }
      }
      pokemon_v2_pokedexname_by_pk(id: $id) {
        name
      }
      pokemon_v2_pokemonitem_by_pk(id: $id) {
        rarity
      }
      pokemon_v2_pokemontype_by_pk(id: $id) {
        slot
        pokemon_v2_type {
          name
        }
      }
      pokemon_v2_version_by_pk(id: $id) {
        name
      }
      pokemon_v2_ability_by_pk(id: $id) {
        name
      }
      pokemon_v2_berry_by_pk(id: $id) {
        name
        natural_gift_power
      }
      pokemon_v2_experience_by_pk(id: $id) {
        level
        experience
      }
      pokemon_v2_locationareaname_by_pk(id: $id) {
        name
      }
      pokemon_v2_nature_by_pk(id: $id) {
        name
      }
    }
  ''';

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{
        'id': id,
      },
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      return PokemonDetailsResponse.fromMap(result.data!);
    } else {
      throw gotNonSuccessResponse(result.exception!);
    }
  }
}
