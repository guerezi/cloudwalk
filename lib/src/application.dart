import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:cloudwalk/src/router/router.dart';
import 'package:flutter/material.dart';

class NasaAPOD extends StatelessWidget {
  const NasaAPOD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nasa's APOD",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0032A0),
          primary: const Color(0xFF0032A0),
          secondary: const Color(0xFFE4002B),
        ),
        useMaterial3: true,
      ),
      routes: routes,
      home: const HomeAPOD(),
    );
  }
}
