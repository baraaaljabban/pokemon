import 'package:flutter/material.dart';
import 'package:pokemon/core/theme/app_style.dart';
import 'package:pokemon/features/pokemon_details/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/image_controller.dart';

class PokemonDetailsController extends StatelessWidget {
  final PokemonDetails pokemonDetails;
  final String id;
  const PokemonDetailsController({
    super.key,
    required this.pokemonDetails,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              height: 300,
              child: ImageController(imageURL: id),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Generation: ${pokemonDetails.generationName}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ability: ${pokemonDetails.abilityName}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Gift Power: ${pokemonDetails.berryGiftPower}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dex Name: ${pokemonDetails.dexName}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Type: ${pokemonDetails.typeName}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Rarity: ${pokemonDetails.rarity}",
              style: AppStyle.h5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Slot: ${pokemonDetails.typeSlot}",
              style: AppStyle.h5,
            ),
          ),
        ],
      ),
    );
  }
}
