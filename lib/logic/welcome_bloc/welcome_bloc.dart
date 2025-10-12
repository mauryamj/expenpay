import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<OnLoginClicked>((event, emit) {
      emit(WelcomeLogin());
    });
    on<OnSignupClicked>((state, emit) {
      emit(WelcomeSignup());
    });
  }
}
