import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:equatable/equatable.dart';

abstract class IApodState extends Equatable {
  const IApodState({
    this.status = ApodStatus.initial,
    this.images = const <NasaApod>[],
    this.hasReachedMax = false,
    this.error,
  });

  final ApodStatus status;
  final List<NasaApod> images;
  final bool hasReachedMax;
  final Object? error;
}
