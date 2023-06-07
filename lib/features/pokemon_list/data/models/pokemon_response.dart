import 'dart:convert';

import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonResponse {
  List<PokemonV2Pokemon> pokemonV2Pokemon;

  PokemonResponse({
    required this.pokemonV2Pokemon,
  });

  factory PokemonResponse.fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      pokemonV2Pokemon: List<PokemonV2Pokemon>.from(map['pokemon_v2_pokemon']?.map((x) => PokemonV2Pokemon.fromMap(x))),
    );
  }

  factory PokemonResponse.fromJson(String source) => PokemonResponse.fromMap(json.decode(source));
}

class PokemonV2Pokemon extends Pokemon {
  String name;
  int id;
  int baseExperience;

  PokemonV2Pokemon({
    required this.name,
    required this.id,
    required this.baseExperience,
  }) : super(
          baseExperience: baseExperience,
          id: id,
          name: name,
        );

  factory PokemonV2Pokemon.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemon(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      baseExperience: map['base_experience']?.toInt() ?? 0,
    );
  }

  factory PokemonV2Pokemon.fromJson(String source) => PokemonV2Pokemon.fromMap(json.decode(source));
}
