import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/constants.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:cloudwalk/src/domain/repositories/nasa.dart';
import 'package:flutter/material.dart';

class HomeApodController {
  HomeApodController({required this.nasaRepository});

  late final ApodBloc apodBloc;
  final NasaRepository nasaRepository;
  final listController = ScrollController();

  NasaApodQueryParams params = NasaApodQueryParams(
    apiKey: Constants.key,
    startDate: DateTime.now().subtract(
      const Duration(
        days: Constants.pageSize,
      ),
    ),
    endDate: DateTime.now(),
  );

  void setAposBloc() {
    apodBloc = ApodBloc(repository: nasaRepository);

    apodBloc.add(GetApod(params: params));
  }

  void dispose() {
    apodBloc.close();
    listController.dispose();
  }

  NasaApodQueryParams get nextPage {
    final endDate = params.startDate.subtract(
      const Duration(days: 1),
    );

    final startDate = params.startDate.subtract(
      const Duration(days: Constants.pageSize),
    );

    params = params.copyWith(
      endDate: endDate,
      startDate: startDate,
    );

    return params;
  }

  Future<void> openSearch(BuildContext context) async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.parse('2024-01-01'),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: params.startDate,
        end: params.endDate,
      ),
    );

    if (range != null) {
      params = params.copyWith(
        endDate: range.end,
        startDate: range.start,
      );

      apodBloc.add(GetRangeApod(params: params));
    }
  }
}
