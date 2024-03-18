import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/pages/details/details_apod_view.dart';
import 'package:cloudwalk/src/pages/home/home_apod_view.dart';
import 'package:cloudwalk/src/router/routes.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get appRoutes => {
      Routes.home: (context) => const HomeApod(),
      Routes.details: (context) => DetailsApod(
            apod: ModalRoute.of(context)?.settings.arguments as NasaApod,
          ),
    };
