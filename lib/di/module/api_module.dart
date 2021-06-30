import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/data_format_interceptor.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../data/verify/collection_api.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setUpDio();
    getIt.registerSingleton(dio);

    // register api
    getIt.registerSingleton(CollectionApi(dio, baseUrl: dio.options.baseUrl));
  }

  static FutureOr<Dio> setUpDio() async {
    final options = BaseOptions(
        connectTimeout: BuildConfig.get()?.connectTimeout,
        receiveTimeout: BuildConfig.get()?.receiveTimeout,
        responseType: ResponseType.json,
        validateStatus: (status) {
          return true;
        },
        baseUrl: BuildConfig.get()?.baseUrl ?? "");

    final Dio dio = Dio(options);

    /// UNIFIED ADD AUTHENTICATION REQUEST HEADER
    // dio.interceptors.add(AuthInterceptor());

    // dio.interceptors.add(TokenInterceptor());

    /// ADAPT DATA (ACCORDING TO YOUR OWN DATA STRUCTURE, YOU CAN CHOOSE TO ADD IT)
    dio.interceptors.add(DataFormatInterceptor());

    /// PRINT LOG (PRODUCTION MODE REMOVAL)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
