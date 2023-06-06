import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/start_up/domain/usecases/logged_in.dart';

part 'start_up_state.dart';

class StartUpCubit extends Cubit<StartUpState> {
  final LoggedIn loggedIn;

  StartUpCubit({
    required this.loggedIn,
  }) : super(StartUpInitial());

  /// function to check some conditions for example is user logged or not etc..
  /// and use it to navigate the user to the intended page
  void onStartUpStartUpEvent() async {
    emit(StartUpLoadingState());
    final result = await loggedIn();
    result.fold(
      (l) => emit(const StartUpIsLoggedInState(isLoggedIn: false)),
      (r) => emit(
        StartUpIsLoggedInState(isLoggedIn: r),
      ),
    );
  }
}
