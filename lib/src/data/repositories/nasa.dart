import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:dio/dio.dart';

/// Abstract Class responsible for Nasa Repository (used mostly for test purposes)
abstract class INasaRepository {
  /// Method responsible for getting the Apod data
  Future<Response> getApod(NasaApodQueryParams params);
}
