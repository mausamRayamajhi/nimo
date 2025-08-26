import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/repositories/market_repository.dart';
import 'package:crypto_app/features/home/cubit/home_bloc.dart';
import 'package:crypto_app/features/home/cubit/home_event.dart';
import 'package:crypto_app/features/home/cubit/home_state.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([MarketRepository])
void main() {
  late MockMarketRepository mockMarketRepository;

  setUp(() {
    mockMarketRepository = MockMarketRepository();
  });

  test('initial state is HomeInitial', () {
    expect(HomeBloc(mockMarketRepository).state, HomeInitial());
  });

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoading, HomeLoaded] when markets are fetched successfully',
    build: () {
      final marketList = MarketList(
        market: [
          const Market(
            id: 'bitcoin',
            symbol: 'btc',
            name: 'Bitcoin',
            currentPrice: 50000.0,
            marketCapRank: 1,
            priceChangePercentage24H: 1.25,
          ),
        ],
      );
      when(
        mockMarketRepository.fetchMarket(),
      ).thenAnswer((_) async => marketList);
      return HomeBloc(mockMarketRepository);
    },
    act: (bloc) => bloc.add(FetchMarkets()),
    expect: () => [
      HomeLoading(),
      HomeLoaded(
        coinList: MarketList(
          market: [
            const Market(
              id: 'bitcoin',
              symbol: 'btc',
              name: 'Bitcoin',
              currentPrice: 50000.0,
              marketCapRank: 1,
              priceChangePercentage24H: 1.25,
            ),
          ],
        ),
      ),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoading, HomeError] when fetchMarkets fails',
    build: () {
      when(
        mockMarketRepository.fetchMarket(),
      ).thenThrow(Exception('Failed to fetch markets'));
      return HomeBloc(mockMarketRepository);
    },
    act: (bloc) => bloc.add(FetchMarkets()),
    expect: () => [
      HomeLoading(),
      isA<
        HomeError
      >(), // We check for the type instead of the exact message, as it depends on the thrown object's toString()
    ],
  );
  test('FetchMarkets event should be equal to another FetchMarkets event', () {
    expect(FetchMarkets(), FetchMarkets());
  });
}
