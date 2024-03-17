import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';

class NasaApodQueryParams {
  final DateTime? date;
  final DateTime startDate;
  final DateTime endDate;
  final String apiKey;

  NasaApodQueryParams({
    this.date,
    required this.startDate,
    required this.endDate,
    required this.apiKey,
  });

  Map<String, dynamic> get toMap => {
        if (date != null) 'date': date?.toSimple,
        'thumbs': true,
        'start_date': startDate.toSimple,
        'end_date': endDate.toSimple,
        'api_key': apiKey,
      };
}
