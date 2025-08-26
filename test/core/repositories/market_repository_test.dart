import 'package:crypto_app/core/repositories/market_repository.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft_foundation/network/crypto_http_client.dart';
import 'package:ft_foundation/network/http_request_definition.dart';
import 'package:ft_foundation/network/http_response.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'market_repository_test.mocks.dart';

@GenerateMocks([CryptoHttpClient])
void main() {
  group('MarketRepository', () {
    late MockCryptoHttpClient mockClient;

    setUp(() {
      mockClient = MockCryptoHttpClient();

      GetIt.I.registerSingleton<CryptoHttpClient>(mockClient);
    });

    tearDown(() {
      GetIt.I.reset();
    });

    test('deserializer converts dynamic data to MarketList', () {
      final requestDefinition = RequestDefinition<MarketList>(
        url: '/coins/markets',
        parameters: {"vs_currency": "usd"},
        deserializer: (dynamic data) {
          return MarketList.fromJsonList(data);
        },
      );

      final mockData = [
        {
          "id": "bitcoin",
          "name": "Bitcoin",
          "symbol": "btc",
          "current_price": 45000.0,
        },
        {
          "id": "ethereum",
          "name": "Ethereum",
          "symbol": "eth",
          "current_price": 3200.0,
        },
      ];

      final result = requestDefinition.deserializer(mockData);

      expect(result.market.length, 2);
      expect(result.market[0].id, "bitcoin");
      expect(result.market[1].name, "Ethereum");
    });

    test('constructor uses SL.get if no client is provided', () {
      final repo = MarketRepository();

      expect(repo, isA<MarketRepository>());
    });

    test('fetchMarket returns MarketList on successful API call', () async {
      final marketRepository = MarketRepository(client: mockClient);
      final mockResponseData = [
        {
          "id": "bitcoin",
          "name": "Bitcoin",
          "symbol": "btc",
          "current_price": 45000.0,
        },
        {
          "id": "ethereum",
          "name": "Ethereum",
          "symbol": "eth",
          "current_price": 3200.0,
        },
      ];

      final mockMarketList = MarketList.fromJsonList(mockResponseData);

      when(mockClient.execute<MarketList>(any)).thenAnswer((_) async {
        return mockMarketList;
      });

      final result = await marketRepository.fetchMarket();

      expect(result.market.length, 2);
      expect(result.market[0].id, 'bitcoin');
      expect(result.market[1].name, 'Ethereum');
      verify(
        mockClient.execute<MarketList>(
          argThat(isA<RequestDefinition<MarketList>>()),
        ),
      ).called(1);
    });

    test('fetchMarket handles a deserialization error', () async {
      final marketRepository = MarketRepository(client: mockClient);

      when(mockClient.execute<MarketList>(any)).thenAnswer((_) async {
        throw const FormatException('Expected a list of JSON objects');
      });

      expect(
        () async => await marketRepository.fetchMarket(),
        throwsA(isA<FormatException>()),
      );
    });

    test('fetchMarket re-throws a general exception', () async {
      final marketRepository = MarketRepository(client: mockClient);
      when(mockClient.execute<MarketList>(any)).thenAnswer((_) async {
        throw Exception('A general error occurred.');
      });

      expect(
        () async => await marketRepository.fetchMarket(),
        throwsA(isA<Exception>()),
      );
    });

    test('fetchMarket re-throws a failure response exception', () async {
      final marketRepository = MarketRepository(client: mockClient);
      when(
        mockClient.execute<MarketList>(any),
      ).thenThrow(FailureResponse(404, 'Not Found'));

      expect(
        () async => await marketRepository.fetchMarket(),
        throwsA(isA<FailureResponse>()),
      );
    });
  });
}
