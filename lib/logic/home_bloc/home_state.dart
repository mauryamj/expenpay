part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeUpdated extends HomeState {}

class HomeLoaded extends HomeState {}
