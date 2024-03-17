import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:cloudwalk/src/router/router.dart';
import 'package:flutter/material.dart';

class Nasa extends MaterialApp {
  const Nasa({super.key});

  @override
  ThemeData? get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0032A0),
          primary: const Color(0xFF0032A0),
          secondary: const Color(0xFFE4002B),
        ),
        useMaterial3: true,
      );

  @override
  String get title => "Nasa's APOD";

  @override
  Map<String, WidgetBuilder>? get routes => appRoutes;

  @override
  Widget? get home => const HomeApod();
}
