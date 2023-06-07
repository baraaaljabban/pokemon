import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemons_list_view_controller.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> with SnackBarHelper {
  @override
  void initState() {
    BlocProvider.of<PokemonListCubit>(context).fetchPokemonListDispatcher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon App'),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      backgroundColor: ThemeColor.backgroundSecondary,
      body: BlocConsumer<PokemonListCubit, PokemonListState>(
        listener: (context, state) {
          if (state is PokemonListErrorState) {
            showErrorSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is PokemonListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonListSuccessState) {
            return PokemonsListViewController(pokemons: state.pokemons);
          }
          return Container();
        },
      ),
    );
  }
}
