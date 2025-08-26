import 'package:crypto_app/core/repositories/coin_repository.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft_foundation/network/crypto_http_client.dart';
import 'package:ft_foundation/network/http_request_definition.dart';
import 'package:ft_foundation/network/http_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'coin_repository_test.mocks.dart';

@GenerateMocks([CryptoHttpClient])
void main() {
  late MockCryptoHttpClient mockClient;
  late CoinRepository repository;

  setUp(() {
    mockClient = MockCryptoHttpClient();
    repository = CoinRepository(client: mockClient);
  });

  group('CoinRepository.fetchCoin', () {
    test('returns Coin when client executes successfully', () async {
      final coinJson = {"id": "bitcoin", "symbol": "btc", "name": "Bitcoin"};
      final expectedCoin = Coin.fromJson(coinJson);

      when(mockClient.execute<Coin>(any)).thenAnswer((_) async => expectedCoin);

      final result = await repository.fetchCoin(id: "bitcoin");

      expect(result.id, equals("bitcoin"));
      expect(result.name, equals("Bitcoin"));
      verify(
        mockClient.execute<Coin>(
          argThat(
            predicate<RequestDefinition<Coin>>(
              (req) => req.url == '/coins/bitcoin',
            ),
          ),
        ),
      ).called(1);
    });

    test(
      'throws FailureResponse when client fails with FailureResponse',
      () async {
        when(
          mockClient.execute<Coin>(any),
        ).thenThrow(FailureResponse(400, 'Bad Request'));

        final call = repository.fetchCoin;

        expect(() => call(id: "bitcoin"), throwsA(isA<FailureResponse>()));
        verify(mockClient.execute<Coin>(any)).called(1);
      },
    );

    test(
      'throws generic Exception when client throws unexpected exception',
      () async {
        when(
          mockClient.execute<Coin>(any),
        ).thenThrow(Exception("Unexpected error"));

        final call = repository.fetchCoin;

        expect(() => call(id: "bitcoin"), throwsA(isA<Exception>()));
        verify(mockClient.execute<Coin>(any)).called(1);
      },
    );
  });
}
