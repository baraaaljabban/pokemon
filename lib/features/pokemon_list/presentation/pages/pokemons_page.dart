import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';
import 'package:pokemon/core/navigation/nav_router.dart';
import 'package:pokemon/core/navigation/navigation_service.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/app_drawer_controller.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/pokemons_list_view_controller.dart';
import 'package:pokemon/features/pokemon_list/presentation/widgets/search_deleget.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> with SnackBarHelper {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<PokemonListCubit>(context).fetchPokemonListDispatcher();
    _searchController.addListener(() {
      final searchQuery = _searchController.text.toLowerCase();
      BlocProvider.of<PokemonListCubit>(context).filterPokemons(searchQuery);
    });
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColor.brandBackground,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          navigationService.navigateTo(NavRouter.newPokemon);
        },
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
            return const PokemonsListViewController();
          }
          return Container();
        },
      ),
    );
  }
}
