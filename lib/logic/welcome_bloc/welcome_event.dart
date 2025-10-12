part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeEvent {}

class OnLoginClicked extends WelcomeEvent{}
class OnSignupClicked extends WelcomeEvent{} 
