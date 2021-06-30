import 'package:configuration/data/common/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse extends BaseResponse {
  CountryResponse();

  @JsonKey(name: 'access')
  String? access;

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
