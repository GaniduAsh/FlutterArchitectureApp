import 'api_enum.dart';
import 'package:http/http.dart' as http;

typedef HttpRequest = Future<http.Response> Function();

class HttpResponse {
  final http.Response? raw;

  NetErrorType? errorType;

  bool get success => errorType == NetErrorType.none;

  String? get body => raw?.body;

  Map<String, String>? get headers => raw?.headers;

  int get statusCode => raw?.statusCode ?? -1;

  HttpResponse(this.raw) {
    if (raw == null) {
      errorType = NetErrorType.disconnected;
    } else if (raw!.statusCode >= 200 && raw!.statusCode <= 299) {
      errorType = NetErrorType.none;
    } else if (raw!.statusCode >= 500 && raw!.statusCode < 600) {
      errorType = NetErrorType.timedOut;
    } else if (raw!.statusCode >= 400 && raw!.statusCode < 500) {
      errorType = NetErrorType.denied;
    }
  }
}
