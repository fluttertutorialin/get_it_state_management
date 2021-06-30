// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return CountryResponse()
    ..timestamp = json['timestamp'] as String?
    ..code = json['code'] as int?
    ..message = json['message'] as String?
    ..error = json['error'] as String?
    ..token = json['token'] as String?
    ..errorBody = json['errorBody']
    ..access = json['access'] as String?;
}

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'token': instance.token,
      'errorBody': instance.errorBody,
      'access': instance.access,
    };
