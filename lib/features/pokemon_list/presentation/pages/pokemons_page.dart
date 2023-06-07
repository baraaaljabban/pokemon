import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/app_drawer_controller.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemons_list_view_controller.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> with SnackBarHelper {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<PokemonListCubit>(context).fetchPokemonListDispatcher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Pokemon App'),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColor.brandBackground,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      drawer: AppDrawer(scaffoldKey: _scaffoldKey),
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
