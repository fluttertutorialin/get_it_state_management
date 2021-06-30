import 'package:configuration/data/common/api_exception.dart';
import 'package:dio/dio.dart';
import '../../model/country_response.dart';
import '../collection_api.dart';

class AppRepository {
  CollectionApi? collectionApi;

  AppRepository({this.collectionApi});

  Future<CountryResponse?> getCountry() async {
    try {
      final response = await collectionApi?.getCountry();
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
