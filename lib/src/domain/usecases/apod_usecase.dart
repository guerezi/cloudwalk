import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';

/// Usecase responsible to call a repository method and deal with its return
/// [repository] - NasaRepository that holds the connection function
class ApodUsecase {
  ApodUsecase(this.repository);

  final INasaRepository repository;

  /// Calls repository [getApod] method and passes a [param] as query params
  Future<List<NasaApod>> execute(NasaApodQueryParams params) async {
    final result = await repository.getApod(params);
    final data = result.data;
    final apods = <NasaApod>[];

    if (data is Map) {
      throw Exception(data['msg']);
    }

    for (var apod in (data as List).reversed) {
      apods.add(NasaApod.fromJson(apod as Map<String, dynamic>));
    }

    return apods;
  }
}
