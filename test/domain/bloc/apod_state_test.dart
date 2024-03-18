// ignore_for_file: prefer_const_constructors
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostState', () {
    test('supports value comparison', () {
      expect(ApodState(), ApodState());
      expect(
        ApodState().toString(),
        ApodState().toString(),
      );
    });

    test('Check copy with changing state', () {
      final state = ApodState(
        status: ApodStatus.initial,
        images: const [],
        hasReachedMax: false,
        error: null,
      );

      final newState = state.copyWith(
        status: ApodStatus.loading,
      );

      expect(newState.status, ApodStatus.loading);
      expect(newState.images, []);
      expect(newState.hasReachedMax, false);
      expect(newState.error, null);
    });
  });
}
