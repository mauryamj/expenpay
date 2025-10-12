part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeUpdated extends HomeState {
  
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<TransactionModel> transactions;
  final double totalIncome;
  final double totalExpense;
  final double balance;

  HomeLoaded({
    required this.transactions,
    required this.totalIncome,
    required this.totalExpense,
    required this.balance,
  });
}
