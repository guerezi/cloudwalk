import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:flutter_test/flutter_test.dart';

import 'nasa_stub.dart';

main() {
  group('NasaReposotory', () {
    final repository = NasaRepositoryStub();
    NasaApodQueryParams params = NasaApodQueryParams(
        startDate: DateTime.now(), endDate: DateTime.now(), apiKey: 'normal');

    test('Check get apod', () async {
      final response = await repository.getApod(params);
      expect(response.statusCode, 200);
      expect(response.data, isA<List>());
    });

    test('Check get apod with error', () async {
      params = params.copyWith(apiKey: 'error');

      final response = await repository.getApod(params);
      expect(response.data, isA<Map>());
      expect(response.data['msg'], isA<String>());
      expect(response.data['code'], isA<int>());
      expect(response.data['code'], 400);
      expect(response.data['msg'], 'start_date cannot be after end_date');
    });
  });
}
