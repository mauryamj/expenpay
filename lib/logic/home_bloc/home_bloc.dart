import 'package:expenpay/logic/home_bloc/transaction_model.dart';
import 'package:expenpay/data/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TransactionRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadTransactions>((event, emit) {
      // final transitions = repository.getAllTransactions();
      emit(HomeLoaded());
    });
  }
}
