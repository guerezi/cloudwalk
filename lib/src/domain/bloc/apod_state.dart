import 'package:cloudwalk/src/data/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';

final class ApodState extends IApodState {
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

  @override
  List<Object?> get props => [status, images, hasReachedMax];
}
