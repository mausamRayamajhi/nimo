import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A custom interceptor to add dynamic headers and log request details.
class AuthInterceptor extends Interceptor {
  // A function to dynamically provide the custom API key.
  final String Function() _getApiKey;

  AuthInterceptor({required String Function() getApiKey})
    : _getApiKey = getApiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Retrieve the token and API key using the provided functions.

    final apiKey = _getApiKey();
    if (apiKey.isNotEmpty) {
      options.headers['x-cg-demo-api-key'] = apiKey;
    }

    if (kDebugMode) {
      // Print the full URI, including the base URL, path, and query parameters.
      print('REQUEST URI: ${options.uri}');
      // Print the full request headers.
      print('REQUEST HEADERS: ${options.headers}');
      // Print the request method.
      print('REQUEST METHOD: ${options.method}');
      // Print the request body, if available.
      if (options.data != null) {
        print('REQUEST BODY: ${options.data}');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      );
      print('ERROR DETAILS: ${err.message}');
    }
    super.onError(err, handler);
  }
}
