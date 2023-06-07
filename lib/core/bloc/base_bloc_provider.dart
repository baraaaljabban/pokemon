import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/dependency_registrar/dependencies.dart';
import 'package:pokemon/features/pokemon_list/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokemon/features/start_up/presentation/cubit/start_up_cubit.dart';

import '../../features/login/presentation/bloc/login_bloc.dart';

class BaseBlocProviderWidget extends StatefulWidget {
  final Widget child;
  const BaseBlocProviderWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BaseBlocProviderWidget> createState() => _BaseBlocProviderWidgetState();
}

class _BaseBlocProviderWidgetState extends State<BaseBlocProviderWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StartUpCubit>(
          create: (context) => sl.get<StartUpCubit>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => sl.get<LoginBloc>(),
        ),
        BlocProvider<PokemonListCubit>(
          create: (context) => sl.get<PokemonListCubit>(),
        ),
      ],
      child: widget.child,
    );
  }
}
