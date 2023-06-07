class PokemonDetails {
  final String move, dexName, generationName, machineName, typeName, versionName, abilityName, berryName, natureName, locationName;
  final int rarity, typeSlot, berryGiftPower, experience, experienceLevel;
  PokemonDetails({
    required this.move,
    required this.generationName,
    required this.machineName,
    required this.typeName,
    required this.versionName,
    required this.abilityName,
    required this.berryName,
    required this.natureName,
    required this.locationName,
    required this.rarity,
    required this.typeSlot,
    required this.berryGiftPower,
    required this.experience,
    required this.experienceLevel,
    required this.dexName,
  });
}
