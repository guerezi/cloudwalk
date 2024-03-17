import 'package:cloudwalk/src/data/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';

class GetApod extends ApodEvents {
  GetApod({required this.params});

  final NasaApodQueryParams params;
}

class GetRangeApod extends ApodEvents {
  GetRangeApod({required this.params});

  final NasaApodQueryParams params;
}
