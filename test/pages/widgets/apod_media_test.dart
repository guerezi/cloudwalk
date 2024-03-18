import 'dart:io';

import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/pages/widgets/apod_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  group('ApodMedia', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('renders image correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ApodMedia(
            type: MediaType.image,
            media: Uri.parse(
                'https://apod.nasa.gov/apod/image/2403/ELT_2024-03-13_1024.jpg'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders video correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: ApodMedia(
              type: MediaType.video,
              media: Uri.parse(''),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(WebViewWidget), findsOneWidget);
    });
  });
}
