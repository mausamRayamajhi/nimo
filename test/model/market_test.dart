import 'package:crypto_app/model/market.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Market Models', () {
    final mockMarketJson = {
      'id': 'bitcoin',
      'symbol': 'btc',
      'name': 'Bitcoin',
      'image':
          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
      'current_price': 65000.0,
      'market_cap': 1280000000000,
      'market_cap_rank': 1,
      'fully_diluted_valuation': 1365000000000,
      'total_volume': 35000000000,
      'high_24h': 66000.0,
      'low_24h': 64000.0,
      'price_change_24h': 1500.0,
      'price_change_percentage_24h': 2.36,
      'market_cap_change_24h': 30000000000.0,
      'market_cap_change_percentage_24h': 2.39,
      'circulating_supply': 19500000.0,
      'total_supply': 21000000.0,
      'max_supply': 21000000.0,
      'ath': 69000.0,
      'ath_change_percentage': -5.79,
      'ath_date': '2021-11-10T14:24:00.000Z',
      'atl': 67.81,
      'atl_change_percentage': 95800.0,
      'atl_date': '2013-07-05T00:00:00.000Z',
      'roi': {'times': 120000.0, 'currency': 'usd', 'percentage': 12000000.0},
      'last_updated': '2025-08-25T08:00:00.000Z',
    };

    final mockNullMarketJson = {
      'id': 'ethereum',
      'symbol': null,
      'name': 'Ethereum',
      'image': null,
      'current_price': 3500.0,
      'market_cap': null,
      'market_cap_rank': null,
      'fully_diluted_valuation': null,
      'total_volume': null,
      'high_24h': null,
      'low_24h': null,
      'price_change_24h': null,
      'price_change_percentage_24h': null,
      'market_cap_change_24h': null,
      'market_cap_change_percentage_24h': null,
      'circulating_supply': null,
      'total_supply': null,
      'max_supply': null,
      'ath': null,
      'ath_change_percentage': null,
      'ath_date': null,
      'atl': null,
      'atl_change_percentage': null,
      'atl_date': null,
      'roi': null,
      'last_updated': null,
    };

    group('Market', () {
      test('fromJson creates a valid Market object from JSON', () {
        final market = Market.fromJson(mockMarketJson);
        expect(market.id, 'bitcoin');
        expect(market.symbol, 'btc');
        expect(market.name, 'Bitcoin');
        expect(market.currentPrice, 65000.0);
        expect(market.marketCapRank, 1);
        expect(market.athDate, DateTime.parse('2021-11-10T14:24:00.000Z'));
        expect(market.lastUpdated, DateTime.parse('2025-08-25T08:00:00.000Z'));
        expect(market.roi, isA<Roi>());
      });

      test('fromJson handles null values correctly', () {
        final market = Market.fromJson(mockNullMarketJson);
        expect(market.id, 'ethereum');
        expect(market.name, 'Ethereum');
        expect(market.symbol, isNull);
        expect(market.image, isNull);
        expect(market.marketCap, isNull);
        expect(market.roi, isNull);
        expect(market.athDate, isNull);
      });

      test(
        'Equatable correctly identifies two identical Market objects as equal',
        () {
          final market1 = Market.fromJson(mockMarketJson);
          final market2 = Market.fromJson(mockMarketJson);
          expect(market1, market2);
        },
      );

      test(
        'Equatable correctly identifies two different Market objects as not equal',
        () {
          final market1 = Market.fromJson(mockMarketJson);
          final market2 = Market.fromJson(mockNullMarketJson);
          expect(market1, isNot(market2));
        },
      );
    });

    group('Roi', () {
      test('fromJson creates a valid Roi object from JSON', () {
        final roiJson = {
          'times': 120000.0,
          'currency': 'usd',
          'percentage': 12000000.0,
        };
        final roi = Roi.fromJson(roiJson);
        expect(roi.times, 120000.0);
        expect(roi.currency, 'usd');
        expect(roi.percentage, 12000000.0);
      });

      test(
        'Equatable correctly identifies two identical Roi objects as equal',
        () {
          final roi1 = Roi.fromJson(
            mockMarketJson['roi'] as Map<String, dynamic>,
          );
          final roi2 = Roi.fromJson(
            mockMarketJson['roi'] as Map<String, dynamic>,
          );
          expect(roi1, roi2);
        },
      );
    });

    group('MarketList', () {
      final mockMarketListJson = [mockMarketJson, mockNullMarketJson];

      test(
        'fromJsonList creates a valid MarketList object from a list of JSON',
        () {
          final marketList = MarketList.fromJsonList(mockMarketListJson);
          expect(marketList.market.length, 2);
          expect(marketList.market.first.id, 'bitcoin');
          expect(marketList.market.last.name, 'Ethereum');
        },
      );

      test('fromJsonList throws a FormatException for invalid input', () {
        final invalidJsonList = [
          mockMarketJson,
          'this is not a map',
          mockNullMarketJson,
        ];
        expect(
          () => MarketList.fromJsonList(invalidJsonList),
          throwsA(isA<FormatException>()),
        );
      });
    });
  });
}
