import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/pages/home/home_apod_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/repositories/nasa_stub.dart';

void main() {
  group('HomeApodController', () {
    final repository = NasaRepositoryStub();
    final controller = HomeApodController(nasaRepository: repository);

    test('normal execution', () {
      controller.setAposBloc();

      expect(controller.apodBloc, isA<ApodBloc>());
    });
  });
}
