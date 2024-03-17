import 'package:cloudwalk/src/domain/models/apod.dart';

abstract class ApodState {
  ApodState({required this.images});

  final List<NasaApod> images;
}
