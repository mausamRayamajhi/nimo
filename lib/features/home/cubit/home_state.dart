import 'package:crypto_app/model/market.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  // Now includes a list of coins to display while loading
  final List<Market> coins;
  const HomeLoading({this.coins = const []});

  @override
  List<Object> get props => [coins];
}

class HomeLoaded extends HomeState {
  final MarketList coinList;
  const HomeLoaded({required this.coinList});

  @override
  List<Object> get props => [coinList];
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
