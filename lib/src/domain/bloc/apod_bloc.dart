import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloudwalk/src/data/bloc/apod_event.dart';
import 'package:cloudwalk/src/data/bloc/apod_state.dart';
import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/usecases/APOD_usecase.dart';

class ApodBloc extends Bloc<ApodEvents, ApodState> {
  ApodBloc({required this.repository}) : super(ApodInitialState()) {
    on(listener);
  }

  final INasaRepository repository;

  Future<void> listener(ApodEvents event, Emitter<ApodState> emit) async {
    final apods = <NasaApod>[];

    try {
      emit(ApodLoadingState());

      if (event is GetApod) {
        apods.addAll(
          await ApodUsecase(repository).execute(event.params),
        );
      }

      emit(ApodSuccessState(images: apods));
    } catch (e) {
      emit(ApodErrorState(error: e));
    }
  }
}
