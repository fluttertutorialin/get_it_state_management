import 'dart:io';
import 'base_response.dart';
import 'response_code.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiException {
  late int? errorCode;
  late String? errorMessage = "";
  late DioError exception;

  String? get displayError {
    if (exception.type == DioErrorType.connectTimeout) {
      return 'Connection time is extended. Please try again';
    }

    if (exception.type == DioErrorType.receiveTimeout) {
      return 'Connection time is extended. Please try again';
    }

    if (exception.type == DioErrorType.sendTimeout) {
      return 'Connection time is extended. Please try again';
    }

    if (exception.type == DioErrorType.other) {
      if (exception.error is SocketException) {
        return 'Please check the network connection.';
      }
      return exception.error.toString();
    }

    // Prioritize error returned in response body
    final responseData = exception.response?.data;
    if (responseData is Map && responseData["message"] != null) {
      final message = responseData["message"];
      if (message is List) {
        return message
            .map((e) => toBeginningOfSentenceCase(e.toString()))
            .join("\n");
      }

      return toBeginningOfSentenceCase(message.toString());
    }

    if (responseData is Map && responseData["error"] != null) {
      return responseData["error"].toString();
    }

    // Fallback to request error if no error returned in response body
    return exception.error?.toString() ?? exception.response?.statusMessage;
  }

  ApiException({required DioError exception}) {
    this.exception = exception;
    switch (exception.type) {
      case DioErrorType.response:
        {
          dynamic errorBody = exception.response?.data;
          try {
            if (errorBody is BaseResponse) {
              errorMessage = errorBody.code == ResponseCode.UNAUTHORIZED ||
                      errorBody.code == ResponseCode.FORBIDDEN
                  ? 'Invalid credentials'
                  : errorBody.code?.message ?? errorBody.error;

              errorCode = errorBody.code;
            }
          } catch (e) {
            errorMessage = e.toString();
            // Try to get Dio internal error which might due to service not available
            if (exception.error != null) {
              errorMessage = exception.error.toString();
            }
            if (exception.response?.statusMessage != null &&
                exception.response?.statusMessage?.isNotEmpty == true) {
              errorMessage = exception.response?.statusMessage;
            }
          }
        }
        break;
      default:
        {
          switch (exception.type) {
            case DioErrorType.cancel:
              {
                errorMessage = 'Cancelled';
                break;
              }
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                errorMessage = 'Connection time is extended. Please try again';
              }
              break;
            default:
              {
                if (exception.error is SocketException) {
                  errorMessage = 'There are some problems with the connection. Please try again';
                } else if (exception.error is HttpException) {
                  errorMessage = 'There are some problems with the connection. Please try again';
                }
              }
          }
        }
    }
  }
}
