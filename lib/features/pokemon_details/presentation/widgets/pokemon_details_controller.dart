import 'package:flutter/material.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: ImageController(imageURL: id),
        )
      ],
    );
  }
}
