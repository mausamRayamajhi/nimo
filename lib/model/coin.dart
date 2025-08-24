import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable(createToJson: false)
class Coin extends Equatable {
  const Coin({
    this.id,
    this.symbol,
    this.name,
    this.webSlug,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.description,
    this.image,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.watchlistPortfolioUsers,
    this.marketCapRank,
    this.lastUpdated,
  });

  final String? id;
  final String? symbol;
  final String? name;

  @JsonKey(name: 'web_slug')
  final String? webSlug;

  @JsonKey(name: 'block_time_in_minutes')
  final int? blockTimeInMinutes;

  @JsonKey(name: 'hashing_algorithm')
  final String? hashingAlgorithm;
  final List<String>? categories;
  final Description? description;
  final Image? image;

  @JsonKey(name: 'genesis_date')
  final DateTime? genesisDate;

  @JsonKey(name: 'sentiment_votes_up_percentage')
  final double? sentimentVotesUpPercentage;

  @JsonKey(name: 'sentiment_votes_down_percentage')
  final double? sentimentVotesDownPercentage;

  @JsonKey(name: 'watchlist_portfolio_users')
  final int? watchlistPortfolioUsers;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  @override
  List<Object?> get props => [
    id,
    symbol,
    name,
    webSlug,
    blockTimeInMinutes,
    hashingAlgorithm,
    categories,
    description,
    image,
    genesisDate,
    sentimentVotesUpPercentage,
    sentimentVotesDownPercentage,
    watchlistPortfolioUsers,
    marketCapRank,
    lastUpdated,
  ];
}

@JsonSerializable(createToJson: false)
class Description extends Equatable {
  const Description({this.en});

  final String? en;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  @override
  List<Object?> get props => [en];
}

@JsonSerializable(createToJson: false)
class Image extends Equatable {
  const Image({this.thumb, this.small, this.large});

  final String? thumb;
  final String? small;
  final String? large;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @override
  List<Object?> get props => [thumb, small, large];
}
