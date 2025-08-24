import 'package:crypto_app/model/coin.dart';
import 'package:ft_foundation/di/service_locator.dart';
import 'package:ft_foundation/network/crypto_http_client.dart';
import 'package:ft_foundation/network/http_request_definition.dart';
import 'package:ft_foundation/network/http_response.dart';

class CoinRepository {
  final CryptoHttpClient? _client;
  CoinRepository({CryptoHttpClient? client})
    : _client = client ?? SL.get<CryptoHttpClient>();

  /// Fetches a list of coins from the market for a specified currency.
  Future<Coin> fetchCoin({required String id}) async {
    if (_client == null) {
      throw Exception('CryptoHttpClient is not initialized.');
    }

    // final Map<String, String> parameters = {"vs_currency": currency.toString()};

    // The generic type is changed to List<Coin> to match the API response.
    final RequestDefinition<Coin> requestDefinition = RequestDefinition(
      url: '/coins/$id',
      // parameters: parameters,
      deserializer: (dynamic data) {
        return Coin.fromJson(data as Map<String, dynamic>);
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
