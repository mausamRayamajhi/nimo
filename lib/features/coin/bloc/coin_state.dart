import 'package:crypto_app/model/coin.dart';
import 'package:equatable/equatable.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {}

class CoinLoaded extends CoinState {
  final Coin coin;
  const CoinLoaded({required this.coin});

  @override
  List<Object> get props => [coin];
}

class CoinError extends CoinState {
  final String message;
  const CoinError({required this.message});

  @override
  List<Object> get props => [message];
}
