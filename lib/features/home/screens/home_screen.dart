import 'package:auto_route/annotations.dart';
import 'package:crypto_app/core/repositories/market_repository.dart';
import 'package:crypto_app/features/app/widgets/app_bar.dart';
import 'package:crypto_app/features/home/cubit/home_bloc.dart';
import 'package:crypto_app/features/home/cubit/home_event.dart';
import 'package:crypto_app/features/home/cubit/home_state.dart';
import 'package:crypto_app/features/home/widgets/crypto_table.dart';
import 'package:crypto_app/features/pull_to_refresh/pull_to_refresh_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(MarketRepository())..add(FetchMarkets()),
        ),
        // BlocProvider(create: (context) => CoinBloc(CoinRepository())),
      ],
      child: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CryptoAppBar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PullToRefreshListView(
          controller: ScrollController(),
          physics: BouncingScrollPhysics(),
          refreshCallBack: () async {
            context.read<HomeBloc>().add(FetchMarkets());
          },

          items: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  return CryptoTable(coins: state.coinList.market);
                  // return CryptoListView(coins: state.coinList.market);
                } else if (state is HomeError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(
                    child: Text('Press the refresh button to load data.'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
