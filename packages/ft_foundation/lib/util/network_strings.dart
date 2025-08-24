class NetworkStrings {
  // Base URLs and Paths
  static const String baseUrl = 'https://api.coingecko.com/api/v3';
  static const String coinsMarketPath = '/coins/markets';

  // Request Header Keys
  static const String apiKey = 'x-cg-demo-api-key';

  //Key Values
  static const String apiKeyValue = 'CG-CWCtmfmbKZcBRGShZYVk5r7q';

  // Log Prefixes and Messages
  static const String requestPrefix = 'REQUEST';
  static const String responsePrefix = 'RESPONSE';
  static const String errorPrefix = 'ERROR';

  // API Response Messages
  static const String badRequest = 'Bad request.';
  static const String unauthorized = 'Unauthorized.';
  static const String forbidden = 'Forbidden.';
  static const String notFound = 'Not found.';
  static const String internalServerError = 'Internal server error.';
  static const String invalidStatusCode = 'Received invalid status code: ';
  static const String unknownError = 'An unknown error occurred.';
  static const String connectionError = 'Connection error: ';

  // Custom Exception Messages
  static const String deserializationError = 'Failed to deserialize response: ';
  static const String clientNotInitialized =
      'CryptoHttpClient is not initialized.';

  // General Logging
  static const String responseStatusCode = 'Response Status Code: ';
  static const String responseData = 'Response Data: ';
  static const String dioError = 'DioError: ';
}
