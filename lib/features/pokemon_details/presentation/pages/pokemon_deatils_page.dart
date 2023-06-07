import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon/core/navigation/nav_args.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsArgs args;
  const PokemonDetailsPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonDetailsCubit>(context).onFetchPokemonDetails(
      pokemonId: widget.args.pokemonId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.pokemonName),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
    );
  }
}
