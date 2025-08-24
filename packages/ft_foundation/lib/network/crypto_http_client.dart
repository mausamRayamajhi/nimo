import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../util/network_strings.dart';
import 'auth_interceptor.dart';
import 'http_request_definition.dart';

/// A singleton class for making network requests using the Dio package.
class CryptoHttpClient {
  /// The Dio instance used for making HTTP requests.
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: NetworkStrings.baseUrl, // Using the string constant
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  //TODO [Crypto App] : getAuthToken and getApiKey need to make option
  /// A private constructor to prevent direct instantiation.
  CryptoHttpClient.internal() {
    _dio.interceptors.add(
      AuthInterceptor(
        // Provide a function that returns the API key.
        // Replace 'YOUR_API_KEY' with a method to get the key.
        getApiKey: () => NetworkStrings.apiKeyValue,
      ),
    );
  }

  /// A generic method to execute any network request defined by [RequestDefinition].
  Future<T> execute<T>(RequestDefinition<T> requestDefinition) async {
    try {
      final response = await _dio.request(
        requestDefinition.url!, // Use the URL from the definition
        queryParameters: requestDefinition.parameters,
        data: requestDefinition.body,
        options: Options(
          method: requestDefinition.methodType.name,
          headers: requestDefinition.header,
        ),
      );
      return _handleResponse<T>(response, requestDefinition.deserializer);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Private helper method to handle responses and deserialize the data.
  T _handleResponse<T>(Response response, T Function(dynamic) deserializer) {
    if (kDebugMode) {
      print('${NetworkStrings.responseStatusCode}${response.statusCode}');
      print('${NetworkStrings.responseData}${response.data}');
    }

    try {
      // Deserialize the response data using the function from the RequestDefinition.
      return deserializer(response.data);
    } catch (e) {
      // Handle deserialization errors
      throw Exception('${NetworkStrings.deserializationError}$e');
    }
  }

  /// Handles network errors and throws a custom exception.
  void _handleError(DioException e) {
    String errorDescription = NetworkStrings.unknownError;
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          errorDescription = NetworkStrings.badRequest;
          break;
        case 401:
          errorDescription = NetworkStrings.unauthorized;
          break;
        case 403:
          errorDescription = NetworkStrings.forbidden;
          break;
        case 404:
          errorDescription = NetworkStrings.notFound;
          break;
        case 500:
          errorDescription = NetworkStrings.internalServerError;
          break;
        default:
          errorDescription =
              '${NetworkStrings.invalidStatusCode}${e.response!.statusCode}';
      }
    } else {
      errorDescription = '${NetworkStrings.connectionError}${e.message}';
    }
    if (kDebugMode) {
      print('${NetworkStrings.dioError}$errorDescription');
    }
    throw DioException(
      requestOptions: e.requestOptions,
      response: e.response,
      type: e.type,
      error: errorDescription,
    );
  }
}
