import 'dart:convert';

import 'package:flutter_beta_app/network/api/http_response.dart';

class ApiResponse<T> {
  T? data;
  ApiResponse(HttpResponse response, T Function(Map<String, dynamic>) parser) {
    if (isNotEmpty(response.body)) {
      data = parser.call(jsonDecode(response.body!));
    }
  }
  bool isEmpty(String? s) {
    return s == null || s.trim().isEmpty;
  }

  bool isNotEmpty(String? s) => !isEmpty(s);
}
