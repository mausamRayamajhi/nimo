import 'package:crypto_app/model/coin.dart';
import 'package:flutter_test/flutter_test.dart' hide Description;

void main() {
  group('Coin Model', () {
    const fullJson = {
      'id': 'bitcoin',
      'symbol': 'btc',
      'name': 'Bitcoin',
      'web_slug': 'bitcoin-web-slug',
      'block_time_in_minutes': 10,
      'hashing_algorithm': 'SHA-256',
      'categories': ['Crypto', 'Currency'],
      'description': {'en': 'A description of Bitcoin.'},
      'image': {
        'thumb': 'thumb_url',
        'small': 'small_url',
        'large': 'large_url',
      },
      'genesis_date': '2009-01-03T00:00:00.000Z',
      'sentiment_votes_up_percentage': 75.5,
      'sentiment_votes_down_percentage': 24.5,
      'watchlist_portfolio_users': 1000,
      'market_cap_rank': 1,
      'last_updated': '2025-08-25T12:00:00.000Z',
    };

    const minimalJson = {
      'id': 'litecoin',
      'symbol': 'ltc',
      'name': 'Litecoin',
      'last_updated': '2025-08-25T12:00:00.000Z',
    };

    test('fromJson should correctly parse a complete JSON payload', () {
      final coin = Coin.fromJson(fullJson);

      expect(coin.id, 'bitcoin');
      expect(coin.symbol, 'btc');
      expect(coin.name, 'Bitcoin');
      expect(coin.webSlug, 'bitcoin-web-slug');
      expect(coin.blockTimeInMinutes, 10);
      expect(coin.hashingAlgorithm, 'SHA-256');
      expect(coin.categories, ['Crypto', 'Currency']);
      expect(coin.description, isA<Description>());
      expect(coin.description?.en, 'A description of Bitcoin.');
      expect(coin.image, isA<Image>());
      expect(coin.image?.thumb, 'thumb_url');
      expect(coin.image?.small, 'small_url');
      expect(coin.image?.large, 'large_url');
      expect(coin.genesisDate, DateTime.utc(2009, 1, 3));
      expect(coin.sentimentVotesUpPercentage, 75.5);
      expect(coin.sentimentVotesDownPercentage, 24.5);
      expect(coin.watchlistPortfolioUsers, 1000);
      expect(coin.marketCapRank, 1);
      expect(coin.lastUpdated, DateTime.utc(2025, 8, 25, 12));
    });

    test('fromJson should handle null and missing fields gracefully', () {
      final coin = Coin.fromJson(minimalJson);

      expect(coin.id, 'litecoin');
      expect(coin.symbol, 'ltc');
      expect(coin.name, 'Litecoin');
      expect(coin.webSlug, isNull);
      expect(coin.blockTimeInMinutes, isNull);
      expect(coin.hashingAlgorithm, isNull);
      expect(coin.categories, isNull);
      expect(coin.description, isNull);
      expect(coin.image, isNull);
      expect(coin.genesisDate, isNull);
      expect(coin.sentimentVotesUpPercentage, isNull);
      expect(coin.sentimentVotesDownPercentage, isNull);
      expect(coin.watchlistPortfolioUsers, isNull);
      expect(coin.marketCapRank, isNull);
      expect(coin.lastUpdated, DateTime.utc(2025, 8, 25, 12));
    });

    test('props list should be complete for equality checks', () {
      final coin1 = Coin.fromJson(fullJson);
      final coin2 = Coin.fromJson(fullJson);
      final differentCoin = Coin.fromJson(minimalJson);

      expect(coin1, equals(coin2));
      expect(coin1, isNot(equals(differentCoin)));
    });
  });

  group('Description Model', () {
    test('fromJson should correctly parse the English description', () {
      final description = Description.fromJson({'en': 'Hello world'});
      expect(description.en, 'Hello world');
    });

    test('fromJson should handle null values', () {
      final description = Description.fromJson({});
      expect(description.en, isNull);
    });

    test('props list should be complete for equality checks', () {
      const desc1 = Description(en: 'test');
      const desc2 = Description(en: 'test');
      const desc3 = Description(en: 'different');

      expect(desc1, equals(desc2));
      expect(desc1, isNot(equals(desc3)));
    });
  });

  group('Image Model', () {
    test('fromJson should correctly parse image URLs', () {
      final image = Image.fromJson({
        'thumb': 'thumb.png',
        'small': 'small.png',
        'large': 'large.png',
      });
      expect(image.thumb, 'thumb.png');
      expect(image.small, 'small.png');
      expect(image.large, 'large.png');
    });

    test('fromJson should handle null values', () {
      final image = Image.fromJson({});
      expect(image.thumb, isNull);
      expect(image.small, isNull);
      expect(image.large, isNull);
    });

    test('props list should be complete for equality checks', () {
      const img1 = Image(thumb: 't', small: 's', large: 'l');
      const img2 = Image(thumb: 't', small: 's', large: 'l');
      const img3 = Image(thumb: 'diff', small: 's', large: 'l');

      expect(img1, equals(img2));
      expect(img1, isNot(equals(img3)));
    });
  });
}
