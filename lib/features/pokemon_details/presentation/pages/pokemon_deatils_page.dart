import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';

import 'package:pokemon/core/navigation/nav_args.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:pokemon/features/pokemon_details/presentation/widgets/pokemon_details_controller.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsArgs args;
  const PokemonDetailsPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> with SnackBarHelper {
  @override
  void initState() {
    BlocProvider.of<PokemonDetailsCubit>(context).onFetchPokemonDetails(
      pokemonId: widget.args.pokemonId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.pokemonName),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      body: BlocConsumer<PokemonDetailsCubit, PokemonDetailsState>(
        listener: (context, state) {
          if (state is PokemonDetailsFailedState) {
            showErrorSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is PokemonDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonDetailsSuccessfulState) {
            return PokemonDetailsController(
              pokemonDetails: state.pokemonDetails,
              id: state.id,
            );
          }
          return Container();
        },
      ),
    );
  }
}
