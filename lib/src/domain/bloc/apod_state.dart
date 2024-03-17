import 'package:cloudwalk/src/data/bloc/apod_state.dart';

class ApodInitialState extends ApodState {
  ApodInitialState() : super(images: []);
}

class ApodLoadingState extends ApodState {
  ApodLoadingState() : super(images: []);
}

class ApodSuccessState extends ApodState {
  ApodSuccessState({required super.images});
}

//TODO: docs
class ApodErrorState extends ApodState {
  final Object error;

  ApodErrorState({required this.error}) : super(images: []);
}
