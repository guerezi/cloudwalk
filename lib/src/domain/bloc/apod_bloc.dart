import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cloudwalk/src/data/bloc/apod_event.dart';
import 'package:cloudwalk/src/data/repositories/nasa.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/usecases/APOD_usecase.dart';
import 'package:stream_transform/stream_transform.dart';

/// ApodBloc responsible for handling Apod events and states
class ApodBloc extends Bloc<IApodEvents, ApodState> {
  ApodBloc({required this.repository}) : super(const ApodState()) {
    on<GetApod>(
      listener,
      transformer: throttleDroppable(throttleDuration),
    );
    on<GetRangeApod>(
      listener,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final INasaRepository repository;

  /// Duration for throttling events
  final throttleDuration = const Duration(milliseconds: 200);

  /// Listener responsible for Apod events and states
  Future<void> listener(IApodEvents event, Emitter<ApodState> emit) async {
    if (state.hasReachedMax) return;

    final apods = <NasaApod>[];

    try {
      if (event is GetApod) {
        apods.addAll(await ApodUsecase(repository).execute(event.params));
      } else if (event is GetRangeApod) {
        emit(state.copyWith(status: ApodStatus.loading));

        apods.clear();
        apods.addAll(await ApodUsecase(repository).execute(event.params));
      }

      emit(
        apods.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: ApodStatus.success,
                images: List.of(state.images)..addAll(apods),
                hasReachedMax: false,
              ),
      );
    } catch (e) {
      emit(state.copyWith(status: ApodStatus.error, error: e));
    }
  }

  /// Throttle events, used to avoid multiple requests (debouncer)
  EventTransformer<E> throttleDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };
  }
}
