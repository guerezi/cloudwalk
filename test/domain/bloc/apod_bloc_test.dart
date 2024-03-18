import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/models/apod_query.dart';
import 'package:cloudwalk/src/domain/usecases/APOD_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../repositories/nasa_stub.dart';

void main() {
  group('ApodBloc', () {
    setUpAll(() {
      registerFallbackValue(Uri());
    });

    test('initial state is ApodState()', () {
      expect(
          ApodBloc(repository: NasaRepositoryStub()).state, const ApodState());
    });

    group('GetApod', () {
      NasaApodQueryParams params = NasaApodQueryParams(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        apiKey: 'normal',
      );

      final repository = NasaRepositoryStub();

      late final List<NasaApod> images;

      setUpAll(() async {
        images = await ApodUsecase(repository).execute(params);
      });

      setUpAll(() {
        registerFallbackValue(
          NasaApodQueryParams(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            apiKey: 'normal',
          ),
        );
      });

      blocTest<ApodBloc, ApodState>(
        'emits nothing when posts has reached maximum amount',
        build: () => ApodBloc(repository: repository),
        seed: () => const ApodState(hasReachedMax: true),
        act: (bloc) => bloc.add(GetApod(params: params)),
        expect: () => <ApodState>[],
      );

      blocTest<ApodBloc, ApodState>(
        'emits successful status when dio fetches initial posts',
        build: () => ApodBloc(repository: repository),
        act: (bloc) => bloc.add(GetApod(params: params)),
        expect: () => [
          ApodState(
            status: ApodStatus.success,
            images: images,
          ),
        ],
      );

      blocTest<ApodBloc, ApodState>(
        'drops new events when processing current event',
        build: () => ApodBloc(repository: repository),
        act: (bloc) => bloc
          ..add(GetApod(params: params))
          ..add(GetApod(params: params)),
        expect: () => <ApodState>[
          ApodState(
            status: ApodStatus.success,
            images: images,
          ),
        ],
      );

      blocTest<ApodBloc, ApodState>(
        'throttles events',
        build: () => ApodBloc(repository: repository),
        act: (bloc) async {
          bloc.add(GetApod(params: params));
          await Future<void>.delayed(Duration.zero);
          bloc.add(GetApod(params: params));
        },
        expect: () => <ApodState>[
          ApodState(
            status: ApodStatus.success,
            images: images,
          ),
        ],
      );

      blocTest<ApodBloc, ApodState>(
        'emits failure status when dio throw exception',
        setUp: () {
          params = params.copyWith(apiKey: 'error');
        },
        build: () => ApodBloc(repository: repository),
        act: (bloc) => bloc.add(GetApod(params: params)),
        expect: () => [
          isA<ApodState>()
              .having(
                (s) => s.status,
                'status',
                ApodStatus.error,
              )
              .having(
                (s) => s.error,
                'error',
                isA<Exception>().having(
                  (e) => e.toString(),
                  'toString',
                  'Exception: start_date cannot be after end_date',
                ),
              ),
        ],
      );

      blocTest<ApodBloc, ApodState>(
        'emits successful status and reaches max',
        setUp: () {
          params = params.copyWith(apiKey: 'empty');
        },
        build: () => ApodBloc(repository: repository),
        seed: () => ApodState(
          status: ApodStatus.success,
          images: images,
        ),
        act: (bloc) => bloc.add(
          GetApod(params: params.copyWith(apiKey: 'empty')),
        ),
        expect: () => <ApodState>[
          ApodState(
            status: ApodStatus.success,
            images: images,
            hasReachedMax: true,
          ),
        ],
      );
    });
  });
}
