import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';
import 'package:pokemon/core/theme/app_dimensions.dart';
import 'package:pokemon/core/theme/app_style.dart';
import 'package:pokemon/core/theme/theme_color.dart';
import 'package:pokemon/features/login/presentation/widgets/mixn_outline_input_border.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';

class NewPokemonPage extends StatefulWidget {
  const NewPokemonPage({super.key});

  @override
  State<NewPokemonPage> createState() => _NewPokemonPageState();
}

class _NewPokemonPageState extends State<NewPokemonPage> with LoginOutlineInputBorder, SnackBarHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Pokemon'),
        centerTitle: true,
        backgroundColor: ThemeColor.brandBackground,
      ),
      body: BlocListener<PokemonListCubit, PokemonListState>(
        listener: (context, state) {
          if (state is PokemonListErrorState) {
            showErrorSnackBar(context, message: state.message);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: AppStyle.largeRegular,
                decoration: InputDecoration(
                  focusedBorder: focuseBorder(),
                  enabledBorder: enableBorder(),
                  disabledBorder: enableBorder(),
                  label: Text(
                    'Pokemon Name',
                    style: AppStyle.largeRegular.copyWith(color: Colors.grey[400]),
                  ),
                ),
                onChanged: (name) {
                  BlocProvider.of<PokemonListCubit>(context).pokemonName(pokemonName: name);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                style: AppStyle.largeRegular,
                decoration: InputDecoration(
                  focusedBorder: focuseBorder(),
                  enabledBorder: enableBorder(),
                  disabledBorder: enableBorder(),
                  label: Text(
                    'Pokemon Experience',
                    style: AppStyle.largeRegular.copyWith(color: Colors.grey[400]),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (experience) {
                  BlocProvider.of<PokemonListCubit>(context).pokemonExperience(pokemonExperience: experience);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        return ThemeColor.buttonBackground;
                      },
                    ),
                    fixedSize: MaterialStateProperty.all(
                      const Size(
                        double.infinity,
                        AppDimensions.c,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppDimensions.xxs,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<PokemonListCubit>(context).addNewPokemon();
                  },
                  child: Text(
                    'Add New Pokemon',
                    style: AppStyle.largeRegular.copyWith(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
