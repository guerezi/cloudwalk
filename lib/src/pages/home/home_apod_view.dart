// ignore_for_file: no_logic_in_create_state

import 'package:cloudwalk/src/data/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/domain/repositories/nasa.dart';
import 'package:cloudwalk/src/pages/home/home_apod_controller.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:cloudwalk/src/pages/widgets/apod_card.dart';
import 'package:cloudwalk/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeApod extends StatefulWidget {
  const HomeApod({super.key, this.controller});

  final HomeApodController? controller;

  @override
  State<HomeApod> createState() => _HomeApodState(
        controller: controller ??
            HomeApodController(
              nasaRepository: NasaRepository(),
            ),
      );
}

class _HomeApodState extends State<HomeApod> {
  _HomeApodState({required this.controller});

  final HomeApodController controller;

  @override
  void initState() {
    controller.setAposBloc();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasa's Apod"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<ApodBloc, ApodState>(
          bloc: controller.apodBloc,
          builder: (context, bloc) {
            if (bloc is ApodSuccessState) {
              return successBody(bloc.images);
            }

            if (bloc is ApodErrorState) {
              return errorBody(bloc.error);
            }

            // case ApodInitialState or ApodLoadingState, the app will show a loading
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }

  Widget successBody(List<NasaApod> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        final apod = data[i];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPagePadding),
              child: Text(
                "${data[i].date.toDisplay}:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ApodCard(
              date: apod.date,
              title: apod.title,
              mediaType: apod.mediaType,
              media: apod.url,
              onClickCallback: () {
                Navigator.of(context)
                    .pushNamed(Routes.details, arguments: apod);
              },
            ),
          ],
        );
      },
    );
  }

  Widget errorBody(dynamic error) {
    return Text(error.toString());
  }
}
