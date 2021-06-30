import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/common/response_code.dart';
import 'package:dio/dio.dart';

class DataFormatInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("statusCode: ${response.statusCode}"
        "\nresponse: ${response.data}");

    if (response.statusCode != 200) {
      final errorMap = response.data == '404' || response.data == 404
          ? <String, dynamic>{
              'code': ResponseCode.NOT_FOUND,
              'message': ResponseCode.NOT_FOUND.message,
              'error': ResponseCode.NOT_FOUND.message,
              'token': null,
            }
          : response.data;

      handler.reject(DioError(
          requestOptions: response.requestOptions,
          response: Response<BaseResponse?>(
            data: BaseResponse.fromJson(errorMap),
            requestOptions: response.requestOptions,
          ),
          type: DioErrorType.response));
      return;
    }
    super.onResponse(response, handler);
  }
}
