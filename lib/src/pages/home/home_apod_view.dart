// ignore_for_file: no_logic_in_create_state

import 'package:cloudwalk/src/domain/bloc/apod_bloc.dart';
import 'package:cloudwalk/src/domain/bloc/apod_event.dart';
import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/enums/apod_staus.dart';
import 'package:cloudwalk/src/domain/repositories/nasa.dart';
import 'package:cloudwalk/src/pages/home/home_apod_controller.dart';
import 'package:cloudwalk/src/pages/widgets/apod_infinite_list.dart';
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
        title: Text(
          "Nasa's Apod",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: BlocProvider(
        create: (_) => controller.apodBloc,
        child: SafeArea(
          child: BlocBuilder<ApodBloc, ApodState>(
            bloc: controller.apodBloc,
            builder: (context, bloc) {
              if (bloc.status == ApodStatus.success) {
                return successBody(bloc);
              }

              if (bloc.status == ApodStatus.error) {
                return errorBody(bloc.error);
              }

              // case ApodInitialState or ApodLoadingState, the app will show a loading
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () => controller.openSearch(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        icon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

  Widget successBody(ApodState data) {
    if (data.images.isEmpty) {
      return const Center(
        child: Text('No Posts'),
      );
    }

    return ApodInfiniteList(
      listController: controller.listController,
      data: data,
      onReachBottomCallback: (listContext) {
        listContext.read<ApodBloc>().add(
              GetApod(
                params: controller.nextPage,
              ),
            );
      },
    );
  }

  Widget errorBody(dynamic error) {
    return Text(error.toString());
  }
}
