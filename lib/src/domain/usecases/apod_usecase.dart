import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';

class ApodUsecase {
  ApodUsecase(this.repository);

  final INasaRepository repository;

  Future<List<NasaApod>> execute(NasaApodQueryParams params) async {
    try {
      final result = await repository.getApod(params);
      final data = result.data as List;
      final apods = <NasaApod>[];

      for (var apod in data) {
        apods.add(NasaApod.fromJson(apod as Map<String, dynamic>));
      }

      return apods;
    } catch (e) {
      rethrow; //TODO: rever
    }
  }
}
