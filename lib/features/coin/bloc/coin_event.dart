import 'package:equatable/equatable.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class FetchCoin extends CoinEvent {
  final String coinId;
  const FetchCoin({required this.coinId});

  @override
  List<Object> get props => [coinId];
}
