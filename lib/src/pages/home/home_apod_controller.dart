import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/constants.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:cloudwalk/src/domain/repositories/nasa.dart';

class HomeApodController {
  HomeApodController({required this.nasaRepository});

  late final ApodBloc apodBloc;
  final NasaRepository nasaRepository;

  void setAposBloc() {
    apodBloc = ApodBloc(repository: nasaRepository);

    final params = NasaApodQueryParams(
      apiKey: Constants.key,
      startDate:
          DateTime.now().subtract(const Duration(days: Constants.pageSize)),
      endDate: DateTime.now(),
    );

    apodBloc.add(GetApod(params: params));
  }

  void dispose() {
    apodBloc.close();
  }
}
