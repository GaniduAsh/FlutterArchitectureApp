import 'dart:developer' as dev;

import 'package:flutter_beta_app/network/api/http_response.dart';
import 'package:http/http.dart' as http;

import 'api_enum.dart';

class BaseApi {
  static Future<HttpResponse> _get(String url,
      {Map<String, String>? headers}) async {
    return await _request(() async {
      return await http.get(Uri.parse(url), headers: headers);
    });
  }

  static Future<HttpResponse> _post(String url,
      {Map<String, String>? headers, Object? body}) async {
    return await _request(() async {
      return await http.post(Uri.parse(url),
          headers: headers, body: body, encoding: null);
    });
  }

  static Future<HttpResponse> _put(String url,
      {Map<String, String>? headers, Object? body}) async {
    return await _request(() async {
      return http.put(Uri.parse(url),
          headers: headers, body: body, encoding: null);
    });
  }

  static Future<HttpResponse> _delete(String url,
      {Map<String, String>? headers, Object? body}) async {
    return await _request(() async {
      return await http.delete(Uri.parse(url),
          headers: headers, body: body, encoding: null);
    });
  }

  static Future<HttpResponse> _head(String url,
      {Map<String, String>? headers}) async {
    return await _request(() async {
      return await http.head(Uri.parse(url), headers: headers);
    });
  }

  static Future<HttpResponse> _request(HttpRequest request) async {
    http.Response response;
    try {
      response = await request();
    } on Exception catch (e) {
      dev.log('Network call failed: ${e.toString()}');
      response = http.Response('ERROR: Could not get a response', 404);
    }
    return HttpResponse(response);
  }

  static Future<HttpResponse> execute(String url, MethodType type,
      {Map<String, String>? headers, dynamic body}) async {
    HttpResponse response;
    switch (type) {
      case MethodType.get:
        response = await _get(url, headers: headers);
        break;
      case MethodType.post:
        response = await _post(url, headers: headers, body: body);
        break;
      case MethodType.put:
        response = await _put(url, headers: headers, body: body);
        break;
      case MethodType.delete:
        response = await _delete(url, headers: headers, body: body);
        break;
      case MethodType.head:
        response = await _head(url, headers: headers);
        break;
    }

    return response;
  }
}
