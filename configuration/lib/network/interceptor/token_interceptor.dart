import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  static const List<int> unauthorizedTokenCodes = [401];

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   Dio _dio = getIt.get<Dio>();
  //   // user not logged in, no need to refresh token
  //   if (SessionPref.getAccessToken() == null &&
  //       SessionPref.getRefreshToken() == null) {
  //     super.onResponse(response, handler);
  //     return;
  //   }
  // }
  //
  // void killSession() {}
}
