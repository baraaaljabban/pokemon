import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/dependency_registrar/dependencies.dart';
import 'package:pokemon/features/start_up/presentation/cubit/start_up_cubit.dart';

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
      ],
      child: widget.child,
    );
  }
}
