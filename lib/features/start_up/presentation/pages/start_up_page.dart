import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/start_up/presentation/cubit/start_up_cubit.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  @override
  void initState() {
    BlocProvider.of<StartUpCubit>(context).onStartUpStartUpEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StartUpCubit, StartUpState>(
        builder: (context, state) {
          return state is StartUpIsLoggedInState
              ? state.isLoggedIn
                  ? const Text("isLoggedIn")
                  : const Text("Not isLoggedIn")
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
        // )),
      ),
    );
  }
}
