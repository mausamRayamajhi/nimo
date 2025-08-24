import 'package:crypto_app/core/repositories/market_repository.dart';
import 'package:crypto_app/features/home/cubit/home_event.dart';
import 'package:crypto_app/features/home/cubit/home_state.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MarketRepository _marketRepository;

  HomeBloc(this._marketRepository) : super(HomeInitial()) {
    on<FetchMarkets>(_onFetchCoins);
  }

  Future<void> _onFetchCoins(
    FetchMarkets event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final MarketList coins = await _marketRepository.fetchMarket();
      emit(HomeLoaded(coinList: coins));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
