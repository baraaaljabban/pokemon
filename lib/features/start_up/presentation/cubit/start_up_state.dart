part of 'start_up_cubit.dart';

abstract class StartUpState extends Equatable {
  const StartUpState();

  @override
  List<Object> get props => [];
}

class StartUpInitial extends StartUpState {}

class StartUpIsLoggedInState extends StartUpState {
  final bool isLoggedIn;
  const StartUpIsLoggedInState({required this.isLoggedIn});
}

class StartUpLoadingState extends StartUpState {}
