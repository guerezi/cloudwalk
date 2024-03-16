import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:flutter/material.dart';

class NasaAPOD extends StatelessWidget {
  const NasaAPOD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeAPOD(),
    );
  }
}
