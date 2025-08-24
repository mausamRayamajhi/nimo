import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market.g.dart';

@JsonSerializable(createToJson: false)
class Market extends Equatable {
  const Market({
    required this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  final String id;
  final String? symbol;
  final String? name;
  final String? image;

  @JsonKey(name: 'current_price')
  final double? currentPrice;

  @JsonKey(name: 'market_cap')
  final int? marketCap;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  @JsonKey(name: 'fully_diluted_valuation')
  final int? fullyDilutedValuation;

  @JsonKey(name: 'total_volume')
  final int? totalVolume;

  @JsonKey(name: 'high_24h')
  final double? high24H;

  @JsonKey(name: 'low_24h')
  final double? low24H;

  @JsonKey(name: 'price_change_24h')
  final double? priceChange24H;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceChangePercentage24H;

  @JsonKey(name: 'market_cap_change_24h')
  final double? marketCapChange24H;

  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double? marketCapChangePercentage24H;

  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;

  @JsonKey(name: 'total_supply')
  final double? totalSupply;

  @JsonKey(name: 'max_supply')
  final double? maxSupply;
  final double? ath;

  @JsonKey(name: 'ath_change_percentage')
  final double? athChangePercentage;

  @JsonKey(name: 'ath_date')
  final DateTime? athDate;
  final double? atl;

  @JsonKey(name: 'atl_change_percentage')
  final double? atlChangePercentage;

  @JsonKey(name: 'atl_date')
  final DateTime? atlDate;
  final Roi? roi;

  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);

  @override
  List<Object?> get props => [
    id,
    symbol,
    name,
    image,
    currentPrice,
    marketCap,
    marketCapRank,
    fullyDilutedValuation,
    totalVolume,
    high24H,
    low24H,
    priceChange24H,
    priceChangePercentage24H,
    marketCapChange24H,
    marketCapChangePercentage24H,
    circulatingSupply,
    totalSupply,
    maxSupply,
    ath,
    athChangePercentage,
    athDate,
    atl,
    atlChangePercentage,
    atlDate,
    roi,
    lastUpdated,
  ];
}

@JsonSerializable(createToJson: false)
class Roi extends Equatable {
  const Roi({this.times, this.currency, this.percentage});

  final double? times;
  final String? currency;
  final double? percentage;

  factory Roi.fromJson(Map<String, dynamic> json) => _$RoiFromJson(json);

  @override
  List<Object?> get props => [times, currency, percentage];
}

class MarketList {
  final List<Market> market;

  MarketList({required this.market});

  // Factory constructor to create a CoinList from a JSON list.
  factory MarketList.fromJsonList(List<dynamic> jsonList) {
    List<Market> markets = jsonList.map((item) {
      if (item is Map<String, dynamic>) {
        return Market.fromJson(item);
      }
      throw const FormatException(
        'Expected a list of JSON objects to create Coin models.',
      );
    }).toList();
    return MarketList(market: markets);
  }
}
