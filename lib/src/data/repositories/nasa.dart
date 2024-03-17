import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:dio/dio.dart';

abstract class INasaRepository {
  Future<Response> getApod(NasaApodQueryParams params);
}
