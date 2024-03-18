import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc Observer for the NasaBloc
/// Responsible for observing the NasaBloc and its transitions
class NasaBlocObserver extends BlocObserver {
  const NasaBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
