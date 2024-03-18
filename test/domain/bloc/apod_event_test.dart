import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Apod Events', () {
    test('supports value comparison', () {
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'key',
      );

      expect(GetApod(params: params), GetApod(params: params));
    });

    test('Check get Apod params', () {
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'key',
      );

      final event = GetApod(params: params);

      expect(event.params, params);
    });

    test('Check get range apod params', () {
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'key',
      );

      final event = GetRangeApod(params: params);

      expect(event.params, params);
    });

    test('Compare Apod Events', () {
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'key',
      );

      expect(GetApod(params: params) == GetRangeApod(params: params), isFalse);
    });
  });
}
