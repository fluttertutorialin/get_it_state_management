import 'response_code.dart';

class BaseResponse {
  String? timestamp;
  int? code;
  String? message;
  String? error;
  String? token;
  dynamic errorBody;

  BaseResponse(
      {this.code, this.message, this.error, this.token, this.errorBody});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['status-code'] ?? ResponseCode.SERVER_UNKNOWN_ERROR;
    message = json['message'] ?? ResponseCode.SERVER_UNKNOWN_ERROR.message;
    error = json['error'] ?? "";
    token = json['token'] ?? "";
    errorBody = json['errorBody'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status-code': this.code,
        'message': this.message,
        'error': this.error,
        'token': this.token,
        'errorBody': this.errorBody,
      };
}
