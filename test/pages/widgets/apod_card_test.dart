import 'dart:io';

import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/pages/widgets/apod_card.dart';
import 'package:cloudwalk/src/pages/widgets/apod_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApodCar', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ApodCard(
              title: 'Title',
              mediaType: MediaType.image,
              media: Uri.parse(
                  'https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_1024.jpg'),
              onClickCallback: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Title'), findsOneWidget);
      expect(find.byType(ApodMedia), findsOneWidget);
    });
  });
}
