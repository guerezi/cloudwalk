import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';

/// Class that holds query params, such as
/// [startDate] the start date of the query
/// [endDate] the end date of the query
/// [apiKey] the api key for the request
class NasaApodQueryParams {
  final DateTime startDate;
  final DateTime endDate;
  final String apiKey;

  NasaApodQueryParams({
    required this.startDate,
    required this.endDate,
    required this.apiKey,
  }) {
    if (startDate.isAfter(endDate) || endDate.isAfter(DateTime.now())) {
      throw ArgumentError('Invalid date range');
    }
  }

  Map<String, dynamic> get toMap => {
        'thumbs': true,
        'start_date': startDate.toSimple,
        'end_date': endDate.toSimple,
        'api_key': apiKey,
      };

  NasaApodQueryParams copyWith({
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
    String? apiKey,
  }) =>
      NasaApodQueryParams(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        apiKey: apiKey ?? this.apiKey,
      );
}
