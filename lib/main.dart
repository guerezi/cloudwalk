import 'package:cloudwalk/src/application.dart';
import 'package:cloudwalk/src/domain/bloc/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const NasaBlocObserver();
  runApp(const Nasa());
}
