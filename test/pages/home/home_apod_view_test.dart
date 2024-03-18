import 'dart:io';

import 'package:cloudwalk/src/pages/home/home_apod_controller.dart';
import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../domain/repositories/nasa_stub.dart';

void main() {
  group('HomeApodView', () {
    setUpAll(() => HttpOverrides.global = null);

    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: HomeApod(
              controller: HomeApodController(
                nasaRepository: NasaRepositoryStub(),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });
  });
}
