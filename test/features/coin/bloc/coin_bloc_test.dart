import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/repositories/coin_repository.dart';
import 'package:crypto_app/features/coin/bloc/coin_bloc.dart';
import 'package:crypto_app/features/coin/bloc/coin_event.dart';
import 'package:crypto_app/features/coin/bloc/coin_state.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'coin_bloc_test.mocks.dart';

@GenerateMocks([CoinRepository])
void main() {
  const String testCoinId = 'bitcoin';

  group('CoinBloc', () {
    late MockCoinRepository mockCoinRepository;

    setUp(() {
      mockCoinRepository = MockCoinRepository();
    });

    test('initial state is CoinInitial', () {
      expect(CoinBloc(mockCoinRepository).state, CoinInitial());
    });

    blocTest<CoinBloc, CoinState>(
      'emits [CoinLoading, CoinLoaded] when FetchCoin is successful',
      setUp: () {
        when(
          mockCoinRepository.fetchCoin(id: testCoinId),
        ).thenAnswer((_) async => const Coin(id: testCoinId, name: 'Bitcoin'));
      },
      build: () => CoinBloc(mockCoinRepository),
      act: (bloc) => bloc.add(const FetchCoin(coinId: testCoinId)),
      expect: () => [
        CoinLoading(),
        const CoinLoaded(
          coin: Coin(id: testCoinId, name: 'Bitcoin'),
        ),
      ],
      verify: (bloc) {
        verify(mockCoinRepository.fetchCoin(id: testCoinId)).called(1);
      },
    );

    blocTest<CoinBloc, CoinState>(
      'emits [CoinLoading, CoinError] when FetchCoin fails',
      setUp: () {
        when(
          mockCoinRepository.fetchCoin(id: testCoinId),
        ).thenThrow(Exception('Failed to fetch coin'));
      },
      build: () => CoinBloc(mockCoinRepository),
      act: (bloc) => bloc.add(const FetchCoin(coinId: testCoinId)),
      expect: () => [
        CoinLoading(),
        CoinError(message: 'Exception: Failed to fetch coin'),
      ],
      verify: (bloc) {
        verify(mockCoinRepository.fetchCoin(id: testCoinId)).called(1);
      },
    );
  });
}
