class SuccessResponse<T> {
  final T data;
  final String? expires;
  final int? statusCode;
  final String? statusMessage;

  SuccessResponse({
    required this.data,
    this.statusCode,
    this.statusMessage,
    this.expires,
  });
}

class FailureResponse {
  final int? statusCode;
  final Object? error;
  final NetworkErrorDescription? errorDescription;
  final String debugInformation;

  FailureResponse(
    this.statusCode,
    this.error, [
    this.errorDescription,
    this.debugInformation = '',
  ]);

  FailureResponse.fromJson(
    Map<String, dynamic> json,
    this.statusCode,
    this.error, [
    this.debugInformation = '',
  ]) : errorDescription = (json['error'] is Map<String, dynamic>)
           ? NetworkErrorDescription.fromJson(json['error'])
           : null;

  @override
  String toString() {
    return 'FailureResponse{statusCode: $statusCode, error: $error, errorDescription: $errorDescription, debugInformation: $debugInformation}';
  }
}

class NetworkErrorDescription {
  String? code;
  String? message;
  int? number;

  NetworkErrorDescription(this.code, this.message, this.number);

  NetworkErrorDescription.fromJson(Map<String, dynamic> json)
    : code = json['code'],
      message = json['message'],
      number = json['number'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'number': number,
  };

  @override
  String toString() {
    return 'NetworkErrorDescription{code: $code, message: $message, number: $number}';
  }
}
