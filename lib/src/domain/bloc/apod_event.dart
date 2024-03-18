import 'package:cloudwalk/src/data/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';

/// Apod Event for requesting Apod data
class GetApod extends IApodEvents {
  GetApod({required this.params});

  final NasaApodQueryParams params;
}

/// Apod Event for requesting a especific range
class GetRangeApod extends IApodEvents {
  GetRangeApod({required this.params});

  final NasaApodQueryParams params;
}
