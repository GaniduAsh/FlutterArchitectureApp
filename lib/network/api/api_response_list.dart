import 'dart:convert';

import 'package:flutter_beta_app/network/api/http_response.dart';

class ApiResponseList<T> {
  List<T>? data;

  ApiResponseList(
      HttpResponse response, T Function(Map<String, dynamic>) parser) {
    if (isNotEmpty(response.body)) {
      data = [];
      var dataList = jsonDecode(response.body!);
      for (Map<String, dynamic> i in dataList) {
        data?.add(parser.call(i));
      }
    }
  }

  bool isEmpty(String? s) {
    return s == null || s.trim().isEmpty;
  }

  bool isNotEmpty(String? s) => !isEmpty(s);
}
