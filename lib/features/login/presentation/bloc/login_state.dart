part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessfullyState extends LoginState {}

class LoginRefreshState extends LoginState {}

class LoginIdleState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});
}
