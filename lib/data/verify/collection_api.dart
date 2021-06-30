import 'package:dio/dio.dart' hide Headers;
import '../model/country_response.dart';
import 'package:retrofit/retrofit.dart';
part 'collection_api.g.dart';

@RestApi()
abstract class CollectionApi {
  factory CollectionApi(Dio dio, {String baseUrl}) = _CollectionApi;

  @GET('countries')
  Future<CountryResponse?>? getCountry();
}