import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:dio/dio.dart';

class NasaRepository extends INasaRepository {
  @override
  Future<Response> getApod(NasaApodQueryParams params) {
    // TODO: rever
    return Dio().get(
      'https://api.nasa.gov/planetary/apod',
      queryParameters: params.toMap,
    );
  }
}
