import '../../data/source/local/sessions_pref.dart';
import 'package:dio/dio.dart';

/// AUTHENTICATION BY TOKEN
class AuthInterceptor extends Interceptor {
  static const String X_API_KEY = 'x-api-key';
  static const String ACCESS_TOKEN = 'Authorization';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    final session = SessionPref.getAccessToken();
    options.headers[ACCESS_TOKEN] = 'Bearer $session';
    super.onRequest(options, handler);
  }
}
