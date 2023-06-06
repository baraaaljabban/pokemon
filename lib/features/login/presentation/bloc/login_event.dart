part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLoginEvent extends LoginEvent {
  const DoLoginEvent();
}

class EmailChangedEvent extends LoginEvent {
  final String email;
  const EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends LoginEvent {
  final String password;
  const PasswordChangedEvent({required this.password});
}
