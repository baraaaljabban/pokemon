import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_syle.dart';
import '../bloc/login_bloc.dart';
import 'mixn_outline_input_border.dart';

class EmailTextField extends StatelessWidget with LoginOutlineInputBorder {
  const EmailTextField({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, LoginState>(
      selector: (isLooginButtonEnabled) {
        return BlocProvider.of<LoginBloc>(context).state;
      },
      builder: (context, state) {
        return TextField(
          enabled: state != LoginLoadingState(),
          style: AppStyle.largeRegular,
          decoration: InputDecoration(
            focusedBorder: foucuseBorder(),
            enabledBorder: enableBorder(),
            disabledBorder: enableBorder(),
            label: Text(
              'Username',
              style: AppStyle.largeRegular.copyWith(color: Colors.grey[400]),
            ),
          ),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) {
            BlocProvider.of<LoginBloc>(context).add(EmailChangedEvent(email: email));
          },
        );
      },
    );
  }
}
