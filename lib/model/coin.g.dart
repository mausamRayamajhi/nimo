// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
  id: json['id'] as String?,
  symbol: json['symbol'] as String?,
  name: json['name'] as String?,
  webSlug: json['web_slug'] as String?,
  blockTimeInMinutes: (json['block_time_in_minutes'] as num?)?.toInt(),
  hashingAlgorithm: json['hashing_algorithm'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] == null
      ? null
      : Description.fromJson(json['description'] as Map<String, dynamic>),
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
  genesisDate: json['genesis_date'] == null
      ? null
      : DateTime.parse(json['genesis_date'] as String),
  sentimentVotesUpPercentage: (json['sentiment_votes_up_percentage'] as num?)
      ?.toDouble(),
  sentimentVotesDownPercentage:
      (json['sentiment_votes_down_percentage'] as num?)?.toDouble(),
  watchlistPortfolioUsers: (json['watchlist_portfolio_users'] as num?)?.toInt(),
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  lastUpdated: json['last_updated'] == null
      ? null
      : DateTime.parse(json['last_updated'] as String),
);

Description _$DescriptionFromJson(Map<String, dynamic> json) =>
    Description(en: json['en'] as String?);

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  thumb: json['thumb'] as String?,
  small: json['small'] as String?,
  large: json['large'] as String?,
);
