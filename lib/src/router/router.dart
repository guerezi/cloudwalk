import 'package:cloudwalk/src/pages/details/details_apod_view.dart';
import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:cloudwalk/src/router/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get routes => {
      Routes.home: (context) => const HomeApod(),
      Routes.details: (context) => const DetailsApod(),
    };
