import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/login/domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String _email = '';
  String _password = '';
  bool enableLoginButton = false;
  final Login login;

  LoginBloc({
    required this.login,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<DoLoginEvent>(_onDoLoginEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
  }

  void _onDoLoginEvent(DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginRefreshState());
    if (_email.isEmpty || _password.isEmpty) {
      emit(const LoginErrorState(message: 'Enter Email And Password'));
    } else {
      emit(LoginLoadingState());
      await _login(emit);
    }
  }

  Future _login(Emitter<LoginState> emit) async {
    final loginCAllResult = await login.call(
        params: LoginParams(
      email: _email,
      password: _password,
    ));
    loginCAllResult.fold(
      (l) => {
        emit(LoginErrorState(message: l.message)),
      },
      (r) => {
        emit(LoginSuccessfullyState()),
      },
    );
  }

  void _onEmailChangedEvent(EmailChangedEvent event, Emitter<LoginState> emit) async {
    _email = event.email;
    _updateLoginButton(emit);
  }

  void _onPasswordChangedEvent(PasswordChangedEvent event, Emitter<LoginState> emit) {
    _password = event.password;
    _updateLoginButton(emit);
  }

  void _updateLoginButton(Emitter<LoginState> emit) {
    emit(LoginRefreshState());
    if (_email.isEmpty || _password.isEmpty) {
      enableLoginButton = false;
    } else {
      enableLoginButton = true;
    }
    emit(LoginIdleState());
  }
}
