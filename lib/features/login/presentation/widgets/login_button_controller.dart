import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/theme_color.dart';
import '../bloc/login_bloc.dart';
import 'loading_screen.dart';

class LoginButtonController extends StatefulWidget {
  final void Function()? onLoginPressed;
  const LoginButtonController({
    Key? key,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  State<LoginButtonController> createState() => _LoginButtonControllerState();
}

class _LoginButtonControllerState extends State<LoginButtonController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return !BlocProvider.of<LoginBloc>(context).enableLoginButton ? Colors.grey[700] : ThemeColor.buttonBackground;
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
          onPressed: (state is LoginLoadingState || !BlocProvider.of<LoginBloc>(context).enableLoginButton) ? null : widget.onLoginPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return const LoadingScreen(
                      color: Colors.white,
                      size: 2,
                    );
                  } else {
                    return BlocSelector<LoginBloc, LoginState, bool>(
                      selector: (isLoginButtonEnabled) {
                        return BlocProvider.of<LoginBloc>(context).enableLoginButton;
                      },
                      builder: (context, state) {
                        return Text(
                          'LogIn',
                          style: AppStyle.largeRegular.copyWith(
                            color: !BlocProvider.of<LoginBloc>(context).enableLoginButton ? Colors.grey : Colors.white,
                          ),
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
