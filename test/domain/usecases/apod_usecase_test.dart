import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:cloudwalk/src/domain/usecases/apod_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/nasa_stub.dart';

main() {
  group('ApodUsecase', () {
    test('normal execution', () {
      final repository = NasaRepositoryStub();
      final usecase = ApodUsecase(repository);
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'normal',
      );

      usecase.execute(params).then((response) {
        expect(response, isA<List<NasaApod>>());
      });
    });

    test('empty response', () {
      final repository = NasaRepositoryStub();
      final usecase = ApodUsecase(repository);
      final params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'empty',
      );

      usecase.execute(params).then((response) {
        expect(response, isA<List<NasaApod>>());
        expect(response.isEmpty, true);
      });
    });
  });
}
