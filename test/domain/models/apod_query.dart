import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NasaApodQueryParams tests', () {
    const apiKey = 'YOUR_API_KEY';
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    test('creates params with today as date', () {
      final params = NasaApodQueryParams(
        date: today,
        startDate: yesterday,
        endDate: tomorrow,
        apiKey: apiKey,
      );

      final map = params.toMap;

      expect(map['date'], today.toSimple);
      expect(map['thumbs'], true);
      expect(map['start_date'], yesterday.toSimple);
      expect(map['end_date'], tomorrow.toSimple);
      expect(map['api_key'], apiKey);
    });

    test('creates params without date', () {
      final params = NasaApodQueryParams(
        startDate: yesterday,
        endDate: tomorrow,
        apiKey: apiKey,
      );

      final map = params.toMap;

      expect(map.containsKey('date'), false);
      expect(map['thumbs'], true);
      expect(map['start_date'], yesterday.toSimple);
      expect(map['end_date'], tomorrow.toSimple);
      expect(map['api_key'], apiKey);
    });

    test('throws error for invalid startDate', () {
      final tomorrow = today.add(const Duration(days: 1));

      expect(
        () => NasaApodQueryParams(
          date: today,
          startDate: tomorrow,
          endDate: yesterday,
          apiKey: apiKey,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('throws error for invalid endDate', () {
      final yesterday = today.subtract(const Duration(days: 1));

      expect(
        () => NasaApodQueryParams(
          date: today,
          startDate: tomorrow,
          endDate: yesterday,
          apiKey: apiKey,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
