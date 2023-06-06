import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/helper/snack_bar_helper.dart';
import 'package:pokemon/core/navigation/nav_router.dart';
import 'package:pokemon/core/navigation/navigation_service.dart';
import 'package:pokemon/core/theme/app_dimensions.dart';
import 'package:pokemon/features/login/presentation/bloc/login_bloc.dart';
import 'package:pokemon/features/login/presentation/widgets/email_text_field_controller.dart';
import 'package:pokemon/features/login/presentation/widgets/login_button_controller.dart';
import 'package:pokemon/features/login/presentation/widgets/password_text_field_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SnackBarHelper {
  late TextEditingController _emailController, _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showErrorSnackBar(context, message: state.message);
          } else if (state is LoginSuccessfullyState) {
            navigationService.pushAndRemoveUntil(NavRouter.landingRoute);
          } else {
            removeErrorSnackBar(context);
          }
        },
        child: Center(
          child: SizedBox(
            height: 350,
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimensions.l),
                  child: EmailTextField(emailController: _emailController),
                ),
                PasswordTextField(passwordController: _passwordController),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimensions.l),
                  child: LoginButtonController(
                    onLoginPressed: () => BlocProvider.of<LoginBloc>(context).add(
                      const DoLoginEvent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
