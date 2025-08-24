import 'package:equatable/equatable.dart';

import 'enums/http_method.dart';

/// Request object to make Http call.
///
/// entryName or Url is mandatory
///
/// entryName is the HAL lookup key.
///
/// if both entryName and Url exists, then entryName is used and url is ignored
class RequestDefinition<T> extends Equatable {
  final String? _entryName;
  final String? _url;
  final MethodType _methodType;
  final Map<String, String>? _parameters;
  final T Function(dynamic) _deserializer;
  final bool _addAuthToken;
  final dynamic _body;
  final Map<String, String>? _header;

  const RequestDefinition({
    String? entryName,
    String? url,
    MethodType methodType = MethodType.GET,
    Map<String, String>? parameters,
    required T Function(dynamic) deserializer,
    dynamic body,
    Map<String, String>? header,
    bool addAuthToken = false,
  }) : assert(entryName != null || url != null),
       _entryName = entryName,
       _parameters = parameters,
       _deserializer = deserializer,
       _body = body,
       _url = url,
       _header = header,
       _methodType = methodType,
       _addAuthToken = addAuthToken;

  String? get entryName => _entryName;

  String? get url => _url;

  Map<String, String>? get parameters => _parameters;

  T Function(dynamic) get deserializer => _deserializer;

  bool get addAuthToken => _addAuthToken;

  dynamic get body => _body;

  MethodType get methodType => _methodType;

  Map<String, String>? get header => _header;

  @override
  List<Object?> get props => [
    _entryName,
    _url,
    _parameters,
    _addAuthToken,
    _body,
    _header,
  ];
}
