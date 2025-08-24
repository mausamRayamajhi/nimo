import 'package:auto_route/annotations.dart';
import 'package:crypto_app/core/repositories/coin_repository.dart';
import 'package:crypto_app/features/app/widgets/app_bar.dart';
import 'package:crypto_app/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_app/features/coin/bloc/coin_event.dart';
import 'package:crypto_app/features/coin/bloc/coin_state.dart';
import 'package:crypto_app/features/coin/widget/coin_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CoinScreen extends StatelessWidget {
  final String coinId;
  const CoinScreen({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CoinBloc(CoinRepository())..add(FetchCoin(coinId: coinId)),
      child: Scaffold(
        appBar: CryptoAppBar(title: "Coin Detail"),
        body: const CoinScreenBody(),
      ),
    );
  }
}

class CoinScreenBody extends StatelessWidget {
  const CoinScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinState>(
      builder: (context, state) {
        if (state is CoinLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CoinError) {
          return Center(child: Text("Error: ${state.message}"));
        } else if (state is CoinLoaded) {
          final coin = state.coin;
          return CoinDetailsWidget(coin: coin);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
