import 'dart:async';

import 'package:cloudwalk/src/data/bloc/apod_event.dart';
import 'package:cloudwalk/src/data/bloc/apod_state.dart';
import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/usecases/APOD_usecase.dart';

class ApodBloc {
  ApodBloc({required this.repository}) {
    _inputStream.stream.listen(inputListener);
  }

  final INasaRepository repository;

  final _inputStream = StreamController<ApodEvents>();
  final _outputStream = StreamController<ApodState>();

  Sink<ApodEvents> get inputApod => _inputStream.sink;
  Stream<ApodState> get outputApod => _outputStream.stream;

  Future<void> inputListener(ApodEvents event) async {
    final apods = <NasaApod>[];

    _outputStream.add(ApodLoadingState());

    if (event is GetApod) {
      apods.addAll(
        await ApodUsecase(repository).execute(event.params),
      );
    }
  }
}
