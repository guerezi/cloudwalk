import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MediaType', () {
    test('contains all expected values', () {
      final expectedValues = ['video', 'image'];

      final actualValues = MediaType.values.map((e) => e.toString()).toList();
      expect(actualValues, expectedValues);
    });

    test('returns a image value using byName()', () {
      final actualValue = MediaType.values.byName('image');

      expect(actualValue, MediaType.image);
    });

    test('returns a video value using byName()', () {
      final actualValue = MediaType.values.byName('video');

      expect(actualValue, MediaType.video);
    });
  });
}
