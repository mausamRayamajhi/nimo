import 'dart:convert';

import 'package:crypto_app/generated/flutter_gen/assets.gen.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter/services.dart';
import 'package:ft_foundation/di/service_locator.dart';
import 'package:ft_foundation/network/crypto_http_client.dart';
import 'package:ft_foundation/network/http_request_definition.dart';
import 'package:ft_foundation/network/http_response.dart';

class MarketRepository {
  final CryptoHttpClient? _client;
  MarketRepository({CryptoHttpClient? client})
    : _client = client ?? SL.get<CryptoHttpClient>();

  /// Fetches the market list from a local JSON file.
  static Future<List<Market>> getMarketListJson() async {
    try {
      // Load the JSON string from the asset file.
      final String jsonString = await rootBundle.loadString(Assets.json.market);

      // Decode the JSON string into a list of dynamic maps.
      final List<dynamic> jsonList = json.decode(jsonString);

      // Map each dynamic map to a Coin object.
      return jsonList.map((json) => Market.fromJson(json)).toList();
    } catch (e) {
      // Handle any potential errors during file loading or JSON decoding.
      throw Exception('Failed to load or parse market list JSON: $e');
    }
  }

  /// Fetches a list of coins from the market for a specified currency.
  Future<MarketList> fetchMarket({String? currency = "usd"}) async {
    if (_client == null) {
      throw Exception('CryptoHttpClient is not initialized.');
    }

    final Map<String, String> parameters = {"vs_currency": currency.toString()};

    // The generic type is changed to List<Coin> to match the API response.
    final RequestDefinition<MarketList> requestDefinition = RequestDefinition(
      url: '/coins/markets',
      parameters: parameters,
      deserializer: (dynamic data) {
        return MarketList.fromJsonList(data);
      },
    );

    try {
      // The execute method now returns a Future<List<Coin>>.
      final response = await _client.execute(requestDefinition);
      return response;
    } on FailureResponse {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
