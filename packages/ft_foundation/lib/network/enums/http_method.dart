import 'package:flutter/foundation.dart';

// ignore_for_file: constant_identifier_names
enum MethodType { GET, POST, PUT, DELETE }

extension MethodTypeExtension on MethodType {
  String get name => describeEnum(this);
}
