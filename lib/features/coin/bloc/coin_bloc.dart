import 'package:crypto_app/core/repositories/coin_repository.dart';
import 'package:crypto_app/features/coin/bloc/coin_event.dart';
import 'package:crypto_app/features/coin/bloc/coin_state.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository _coinRepository;

  CoinBloc(this._coinRepository) : super(CoinInitial()) {
    on<FetchCoin>(_onFetchCoins);
  }

  Future<void> _onFetchCoins(FetchCoin event, Emitter<CoinState> emit) async {
    emit(CoinLoading());
    try {
      final Coin coin = await _coinRepository.fetchCoin(id: event.coinId);
      emit(CoinLoaded(coin: coin));
    } catch (e) {
      emit(CoinError(message: e.toString()));
    }
  }
}
