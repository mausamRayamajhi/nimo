// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
  id: json['id'] as String,
  symbol: json['symbol'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  currentPrice: (json['current_price'] as num?)?.toDouble(),
  marketCap: (json['market_cap'] as num?)?.toInt(),
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toInt(),
  totalVolume: (json['total_volume'] as num?)?.toInt(),
  high24H: (json['high_24h'] as num?)?.toDouble(),
  low24H: (json['low_24h'] as num?)?.toDouble(),
  priceChange24H: (json['price_change_24h'] as num?)?.toDouble(),
  priceChangePercentage24H: (json['price_change_percentage_24h'] as num?)
      ?.toDouble(),
  marketCapChange24H: (json['market_cap_change_24h'] as num?)?.toDouble(),
  marketCapChangePercentage24H:
      (json['market_cap_change_percentage_24h'] as num?)?.toDouble(),
  circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
  totalSupply: (json['total_supply'] as num?)?.toDouble(),
  maxSupply: (json['max_supply'] as num?)?.toDouble(),
  ath: (json['ath'] as num?)?.toDouble(),
  athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
  athDate: json['ath_date'] == null
      ? null
      : DateTime.parse(json['ath_date'] as String),
  atl: (json['atl'] as num?)?.toDouble(),
  atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
  atlDate: json['atl_date'] == null
      ? null
      : DateTime.parse(json['atl_date'] as String),
  roi: json['roi'] == null
      ? null
      : Roi.fromJson(json['roi'] as Map<String, dynamic>),
  lastUpdated: json['last_updated'] == null
      ? null
      : DateTime.parse(json['last_updated'] as String),
);

Roi _$RoiFromJson(Map<String, dynamic> json) => Roi(
  times: (json['times'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  percentage: (json['percentage'] as num?)?.toDouble(),
);
