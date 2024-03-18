import 'package:cloudwalk/src/data/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';

/// Holds the current state of the ApodBloc </br>
/// [status] - The current status of the ApodBloc </br>
/// [images] - The current list of images </br>
/// [hasReachedMax] - A boolean value that indicates if the list has reached the maximum amount of images </br>
/// [error] - The current error if any
class ApodState extends IApodState {
  const ApodState({
    super.status,
    super.images,
    super.hasReachedMax,
    super.error,
  });

  ApodState copyWith({
    ApodStatus? status,
    List<NasaApod>? images,
    bool? hasReachedMax,
    Object? error,
  }) =>
      ApodState(
        status: status ?? this.status,
        images: images ?? this.images,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        error: error ?? this.error,
      );
}
