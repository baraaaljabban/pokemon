import 'dart:convert';

import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';

class PokemonDetailsResponse extends PokemonDetails {
  PokemonV2ItemGameIndexByPk? pokemonV2ItemGameIndexByPk;
  GeneralPokemonV2? pokemonV2LocationByPk;
  PokemonV2MachineByPk? pokemonV2MachineByPk;
  GeneralPokemonV2? pokemonV2PokeDexNameByPk;
  PokemonV2PokemonItemByPk? pokemonV2PokemonItemByPk;
  PokemonV2PokemonTypeByPk? pokemonV2PokemonTypeByPk;
  GeneralPokemonV2? pokemonV2VersionByPk;
  GeneralPokemonV2? pokemonV2AbilityByPk;
  PokemonV2BerryByPk? pokemonV2BerryByPk;
  PokemonV2ExperienceByPk? pokemonV2ExperienceByPk;
  GeneralPokemonV2? pokemonV2LocationAreaNameByPk;
  GeneralPokemonV2? pokemonV2NatureByPk;

  PokemonDetailsResponse({
    this.pokemonV2ItemGameIndexByPk,
    this.pokemonV2LocationByPk,
    this.pokemonV2MachineByPk,
    this.pokemonV2PokeDexNameByPk,
    this.pokemonV2PokemonItemByPk,
    this.pokemonV2PokemonTypeByPk,
    this.pokemonV2VersionByPk,
    this.pokemonV2AbilityByPk,
    this.pokemonV2BerryByPk,
    this.pokemonV2ExperienceByPk,
    this.pokemonV2LocationAreaNameByPk,
    this.pokemonV2NatureByPk,
  }) : super(
          move: '',
          generationName: pokemonV2ItemGameIndexByPk?.pokemonV2Generation?.name ?? '',
          machineName: pokemonV2MachineByPk?.pokemonV2Move?.name ?? '',
          typeName: pokemonV2PokemonTypeByPk?.pokemonV2Type?.name ?? '',
          versionName: pokemonV2VersionByPk?.name ?? '',
          abilityName: pokemonV2AbilityByPk?.name ?? '',
          berryName: pokemonV2BerryByPk?.name ?? '',
          natureName: pokemonV2NatureByPk?.name ?? '',
          locationName: pokemonV2LocationByPk?.name ?? '',
          rarity: pokemonV2PokemonItemByPk?.rarity ?? 0,
          typeSlot: pokemonV2PokemonTypeByPk?.slot ?? 0,
          berryGiftPower: pokemonV2BerryByPk?.naturalGiftPower ?? 0,
          experience: pokemonV2ExperienceByPk?.experience ?? 0,
          experienceLevel: pokemonV2ExperienceByPk?.level ?? 0,
          dexName: pokemonV2PokeDexNameByPk?.name ?? '',
        );

  factory PokemonDetailsResponse.fromMap(Map<String, dynamic> map) {
    return PokemonDetailsResponse(
      pokemonV2ItemGameIndexByPk:
          map['pokemon_v2_itemgameindex_by_pk'] != null ? PokemonV2ItemGameIndexByPk.fromMap(map['pokemon_v2_itemgameindex_by_pk']) : null,
      pokemonV2LocationByPk: map['pokemon_v2_location_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_location_by_pk']) : null,
      pokemonV2MachineByPk: map['pokemon_v2_machine_by_pk'] != null ? PokemonV2MachineByPk.fromMap(map['pokemon_v2_machine_by_pk']) : null,
      pokemonV2PokeDexNameByPk:
          map['pokemon_v2_pokedexname_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_pokedexname_by_pk']) : null,
      pokemonV2PokemonItemByPk:
          map['pokemon_v2_pokemonitem_by_pk'] != null ? PokemonV2PokemonItemByPk.fromMap(map['pokemon_v2_pokemonitem_by_pk']) : null,
      pokemonV2PokemonTypeByPk:
          map['pokemon_v2_pokemontype_by_pk'] != null ? PokemonV2PokemonTypeByPk.fromMap(map['pokemon_v2_pokemontype_by_pk']) : null,
      pokemonV2VersionByPk: map['pokemon_v2_version_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_version_by_pk']) : null,
      pokemonV2AbilityByPk: map['pokemon_v2_ability_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_ability_by_pk']) : null,
      pokemonV2BerryByPk: map['pokemon_v2_berry_by_pk'] != null ? PokemonV2BerryByPk.fromMap(map['pokemon_v2_berry_by_pk']) : null,
      pokemonV2ExperienceByPk:
          map['pokemon_v2_experience_by_pk'] != null ? PokemonV2ExperienceByPk.fromMap(map['pokemon_v2_experience_by_pk']) : null,
      pokemonV2LocationAreaNameByPk:
          map['pokemon_v2_locationareaname_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_locationareaname_by_pk']) : null,
      pokemonV2NatureByPk: map['pokemon_v2_nature_by_pk'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_nature_by_pk']) : null,
    );
  }

  factory PokemonDetailsResponse.fromJson(String source) => PokemonDetailsResponse.fromMap(json.decode(source));
}

class GeneralPokemonV2 {
  String? name;

  GeneralPokemonV2({
    this.name,
  });

  factory GeneralPokemonV2.fromMap(Map<String, dynamic> map) {
    return GeneralPokemonV2(
      name: map['name'],
    );
  }

  factory GeneralPokemonV2.fromJson(String source) => GeneralPokemonV2.fromMap(json.decode(source));
}

class PokemonV2BerryByPk {
  String? name;
  int? naturalGiftPower;

  PokemonV2BerryByPk({
    this.name,
    this.naturalGiftPower,
  });

  factory PokemonV2BerryByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2BerryByPk(
      name: map['name'],
      naturalGiftPower: map['natural_gift_power']?.toInt(),
    );
  }

  factory PokemonV2BerryByPk.fromJson(String source) => PokemonV2BerryByPk.fromMap(json.decode(source));
}

class PokemonV2ExperienceByPk {
  int? level;
  int? experience;

  PokemonV2ExperienceByPk({
    this.level,
    this.experience,
  });

  factory PokemonV2ExperienceByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2ExperienceByPk(
      level: map['level']?.toInt(),
      experience: map['experience']?.toInt(),
    );
  }

  factory PokemonV2ExperienceByPk.fromJson(String source) => PokemonV2ExperienceByPk.fromMap(json.decode(source));
}

class PokemonV2ItemGameIndexByPk {
  GeneralPokemonV2? pokemonV2Generation;

  PokemonV2ItemGameIndexByPk({
    this.pokemonV2Generation,
  });

  factory PokemonV2ItemGameIndexByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2ItemGameIndexByPk(
      pokemonV2Generation: map['pokemon_v2_generation'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_generation']) : null,
    );
  }

  factory PokemonV2ItemGameIndexByPk.fromJson(String source) => PokemonV2ItemGameIndexByPk.fromMap(json.decode(source));
}

class PokemonV2MachineByPk {
  GeneralPokemonV2? pokemonV2Move;

  PokemonV2MachineByPk({
    this.pokemonV2Move,
  });

  factory PokemonV2MachineByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2MachineByPk(
      pokemonV2Move: map['pokemonV2Move'] != null ? GeneralPokemonV2.fromMap(map['pokemonV2Move']) : null,
    );
  }

  factory PokemonV2MachineByPk.fromJson(String source) => PokemonV2MachineByPk.fromMap(json.decode(source));
}

class PokemonV2PokemonItemByPk {
  int? rarity;

  PokemonV2PokemonItemByPk({
    this.rarity,
  });

  factory PokemonV2PokemonItemByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2PokemonItemByPk(
      rarity: map['rarity']?.toInt(),
    );
  }

  factory PokemonV2PokemonItemByPk.fromJson(String source) => PokemonV2PokemonItemByPk.fromMap(json.decode(source));
}

class PokemonV2PokemonTypeByPk {
  int? slot;
  GeneralPokemonV2? pokemonV2Type;

  PokemonV2PokemonTypeByPk({
    this.slot,
    this.pokemonV2Type,
  });

  factory PokemonV2PokemonTypeByPk.fromMap(Map<String, dynamic> map) {
    return PokemonV2PokemonTypeByPk(
      slot: map['slot']?.toInt(),
      pokemonV2Type: map['pokemon_v2_type'] != null ? GeneralPokemonV2.fromMap(map['pokemon_v2_type']) : null,
    );
  }

  factory PokemonV2PokemonTypeByPk.fromJson(String source) => PokemonV2PokemonTypeByPk.fromMap(json.decode(source));
}
