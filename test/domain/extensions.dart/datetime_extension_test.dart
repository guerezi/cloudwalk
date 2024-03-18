// ignore_for_file: prefer_const_constructors
import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateFormat', () {
    test('Test Date extension toSimple', () {
      final date = DateTime.parse('2021-08-01');
      final formattedDate = date.toSimple;
      expect(formattedDate, '2021-08-01');
    });

    test('Test DateTime extension toDisplay', () {
      final date = DateTime.parse('2021-08-01');
      final formattedDate = date.toDisplay;
      expect(formattedDate, '2021/8/1');
    });
  });
}
