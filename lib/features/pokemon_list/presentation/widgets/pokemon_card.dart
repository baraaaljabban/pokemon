import 'package:flutter/material.dart';
import 'package:pokemon/core/constant/constants.dart';
import 'package:pokemon/core/navigation/nav_args.dart';
import 'package:pokemon/core/navigation/nav_router.dart';
import 'package:pokemon/core/navigation/navigation_service.dart';
import 'package:pokemon/core/theme/app_syle.dart';
import 'package:pokemon/core/theme/theme_color.dart';

import 'package:pokemon/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        child: ListTile(
          onTap: () => {
            navigationService.navigateTo(
              NavRouter.pokemonDetails,
              arguments: PokemonDetailsArgs(
                pokemonId: widget.pokemon.id,
              ),
            ),
          },
          leading: SizedBox(
            height: 65,
            width: 65,
            child: Image.network(
              "$imageBaseUrl${widget.pokemon.id}.png",
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          title: Text(
            widget.pokemon.name,
            style: AppStyle.title,
          ),
          subtitle: Text(
            "Experience: ${widget.pokemon.baseExperience}",
            style: AppStyle.subtitle3.copyWith(
              color: ThemeColor.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
