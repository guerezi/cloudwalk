import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NasaApodQueryParams', () {
    const apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

    test('toMap creates a map with non-null properties', () {
      final params = NasaApodQueryParams(
        date: DateTime.parse('2024-03-17'),
        thumbs: true,
        apiKey: apiKey,
      );

      final expectedMap = {
        'date': '2024-03-17',
        'thumbs': true,
        'api_key': apiKey,
      };

      expect(params.toMap, expectedMap);
    });

    test('toMap excludes null properties', () {
      final params = NasaApodQueryParams(
        apiKey: apiKey,
      );

      final expectedMap = {
        'thumbs': false,
        'api_key': apiKey,
      };

      expect(params.toMap, expectedMap);
    });
  });
}
