import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/constants.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:dio/dio.dart';

class NasaRepository extends INasaRepository {
  @override
  Future<Response> getApod(NasaApodQueryParams params) {
    return Dio().get(
      Constants.nasasApiUrl,
      queryParameters: params.toMap,
    );
  }
}
