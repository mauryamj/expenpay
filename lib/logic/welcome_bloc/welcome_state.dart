part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeState {}

final class WelcomeInitial extends WelcomeState {}
final class WelcomeLogin extends WelcomeState {}
final class WelcomeSignup extends WelcomeState {}
