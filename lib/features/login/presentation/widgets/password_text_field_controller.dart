import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/login/presentation/widgets/mixn_outline_input_border.dart';

import '../../../../core/theme/app_style.dart';
import '../bloc/login_bloc.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> with LoginOutlineInputBorder {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, LoginState>(
      selector: (isLoginButtonEnabled) {
        return BlocProvider.of<LoginBloc>(context).state;
      },
      builder: (context, state) {
        return TextField(
          enabled: state != LoginLoadingState(),
          style: AppStyle.largeRegular,
          decoration: InputDecoration(
            focusedBorder: focuseBorder(),
            enabledBorder: enableBorder(),
            disabledBorder: enableBorder(),
            label: Text(
              'Password',
              style: AppStyle.largeRegular.copyWith(color: Colors.grey[400]),
            ),
          ),
          onChanged: (password) {
            BlocProvider.of<LoginBloc>(context).add(PasswordChangedEvent(password: password));
          },
          maxLines: 1,
          obscureText: isPasswordHidden,
          controller: widget._passwordController,
          keyboardType: TextInputType.text,
        );
      },
    );
  }
}
