import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NasaApod', () {
    final testJson = {
      "date": "2024-03-16",
      "explanation": "Explanation text",
      "hdurl": "https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_2048.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Test Title",
      "url": "https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_1024.jpg",
    };

    test('fromJson creates a NasaApod object from a JSON map', () {
      final apod = NasaApod.fromJson(testJson);

      expect(apod.date, const TypeMatcher<String>());
      expect(apod.date, DateTime.parse(testJson["date"] as String));
      expect(apod.explanation, testJson["explanation"]);
      expect(apod.mediaType, MediaType.image);
      expect(apod.serviceVersion, testJson["service_version"]);
      expect(apod.title, testJson["title"]);
      expect(apod.hdurl, const TypeMatcher<Uri>());
      expect(apod.hdurl, testJson["hdurl"]);
      expect(apod.url, const TypeMatcher<Uri>());
      expect(apod.url, testJson["url"]);
    });
  });
}
