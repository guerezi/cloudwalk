import 'dart:io';

import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/pages/widgets/apod_card.dart';
import 'package:cloudwalk/src/pages/widgets/apod_infinite_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApodInfiniteList', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('renders correctly', (tester) async {
      final listController = ScrollController();
      final data = ApodState(
        status: ApodStatus.success,
        images: [
          NasaApod.fromJson(
            const {
              "date": "2024-03-16",
              "explanation": "Explanation text",
              "hdurl": "",
              "media_type": "image",
              "service_version": "v1",
              "title": "Image Title",
              "url": "",
            },
          ),
          NasaApod.fromJson(
            const {
              "date": "2024-03-15",
              "explanation": "Another text",
              "media_type": "video",
              "service_version": "v1",
              "title": "Video Title",
              "url": "",
            },
          ),
        ],
        hasReachedMax: false,
      );
      onReachBottomCallback(BuildContext context) {}

      await tester.pumpWidget(
        Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ApodInfiniteList(
              listController: listController,
              data: data,
              onReachBottomCallback: onReachBottomCallback,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ApodCard), findsNWidgets(2));
      expect(find.text('Image Title'), findsOneWidget);
      expect(find.text('2024/3/16'), findsOneWidget);
      expect(find.text('Video Title'), findsOneWidget);
      expect(find.text('2024/3/15'), findsOneWidget);
    });
  });
}
