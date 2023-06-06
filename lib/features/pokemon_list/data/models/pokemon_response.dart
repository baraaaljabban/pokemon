import 'dart:convert';

class PokemonResponse {
  Data data;

  PokemonResponse({
    required this.data,
  });

  factory PokemonResponse.fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      data: Data.fromMap(map['data']),
    );
  }

  factory PokemonResponse.fromJson(String source) => PokemonResponse.fromMap(json.decode(source));
}

class Data {
  List<PokemonV2Pokemon> pokemonV2Pokemon;

  Data({
    required this.pokemonV2Pokemon,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      pokemonV2Pokemon: List<PokemonV2Pokemon>.from(map['pokemon_v2_pokemon']?.map((x) => PokemonV2Pokemon.fromMap(x))),
    );
  }

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class PokemonV2Pokemon {
  String name;
  int id;
  int baseExperience;

  PokemonV2Pokemon({
    required this.name,
    required this.id,
    required this.baseExperience,
  });

  factory PokemonV2Pokemon.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemon(
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      baseExperience: map['base_experience']?.toInt() ?? 0,
    );
  }

  factory PokemonV2Pokemon.fromJson(String source) => PokemonV2Pokemon.fromMap(json.decode(source));
}
