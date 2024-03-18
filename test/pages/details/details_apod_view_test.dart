import 'dart:io';

import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/pages/details/details_apod_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailsApodView', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('renders correctly', (tester) async {
      final apod = NasaApod.fromJson(
        const {
          "date": "2024-03-16",
          "explanation": "Explanation text",
          "hdurl":
              "https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_2048.jpg",
          "media_type": "image",
          "service_version": "v1",
          "title": "Image Title",
          "url":
              "https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_1024.jpg",
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: DetailsApod(apod: apod),
          ),
        ),
      );

      await tester.pumpAndSettle();
    });
  });
}
